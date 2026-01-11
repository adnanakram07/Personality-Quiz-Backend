import { Controller, Get, Post, Body } from '@nestjs/common';
import { QuizService } from './quiz.service';
import { SubmitQuizDto } from './dto/submit-quiz.dto';

@Controller()
export class QuizController {
  constructor(private readonly quizService: QuizService) {}

  @Get('questions')
  getQuestions() {
    return this.quizService.getQuestions();
  }

  @Post('quiz/submit')
  submitQuiz(@Body() body: SubmitQuizDto) {
    return this.quizService.submitQuiz(body);
  }

  @Get('personalities')
  getPersonalities() {
    return this.quizService.getPersonalities();
  }
}
