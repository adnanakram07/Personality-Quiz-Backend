import { Injectable } from '@nestjs/common';
import { SupabaseService } from '../supabase/supabase.service';
import { SubmitQuizDto } from './dto/submit-quiz.dto';

@Injectable()
export class QuizService {
  constructor(private readonly supabaseService: SupabaseService) {}

  /* =======================
     Utility
     ======================= */
  private shuffleArray<T>(array: T[]): T[] {
    return [...array].sort(() => Math.random() - 0.5);
  }

  /* =======================
     GET /questions
     ======================= */
  async getQuestions() {
    const supabase = this.supabaseService.getClient();

    const { data, error } = await supabase.from('questions').select(`
      id,
      question_text,
      options (
        id,
        option_text,
        order_index
      )
    `);

    if (error) {
      throw new Error(error.message);
    }

    return this.shuffleArray(data ?? []);
  }

  /* =======================
     POST /quiz/submit
     ======================= */
  async submitQuiz(body: SubmitQuizDto) {
    // ✅ MOVE THIS LINE INSIDE THE METHOD
    const { answers, name, age, email } = body;

    if (!answers || answers.length === 0) {
      return {
        message: 'No answers submitted',
      };
    }

    const supabase = this.supabaseService.getClient();
    const optionIds = answers.map((a) => a.optionId);

    const { data, error } = await supabase
      .from('option_personality_scores')
      .select(`
        option_id,
        points,
        personalities!inner (
          id,
          code,
          name,
          description
        ),
        options!inner (
          question_id,
          questions!inner (
            weight
          )
        )
      `)
      .in('option_id', optionIds);

    if (error) {
      throw new Error(error.message);
    }

    /* =======================
       STEP 1: Compute scores
       ======================= */
    const personalityScores: Record<string, number> = {};

    (data as any[]).forEach((row) => {
      const personalityCode = row.personalities.code;
      const points = row.points;
      const weight = row.options.questions.weight;

      const contribution = weight * points;

      personalityScores[personalityCode] =
        (personalityScores[personalityCode] ?? 0) + contribution;
    });

    /* =======================
       STEP 2: Top personality
       ======================= */
    let topPersonality: string | null = null;
    let maxScore = -Infinity;

    Object.entries(personalityScores).forEach(([code, score]) => {
      if (
        score > maxScore ||
        (score === maxScore && topPersonality !== null && code < topPersonality)
      ) {
        maxScore = score;
        topPersonality = code;
      }
    });

    const topPersonalityDetails = (data as any[])
      .find((row) => row.personalities.code === topPersonality)
      ?.personalities;

    /* =======================
       FINAL RESPONSE
       ======================= */
    return {
      message: 'Quiz submitted',
      user: {
        name,
        age,
        email,
      },
      topPersonality: topPersonalityDetails,
      personalityScores,
    };
  }

  async getPersonalities() {
    const supabase = this.supabaseService.getClient();

    const { data, error } = await supabase
      .from('personalities')
      .select('id, code, name, description');

    if (error) throw new Error(error.message);
    return data;
  }
}
