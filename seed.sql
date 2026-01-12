-- =========================================
-- Personality Quiz Seed File
-- FINAL & CLEAN (NO created_at)
-- =========================================

BEGIN;

-- -----------------------------------------
-- CLEAN EXISTING DATA
-- -----------------------------------------
TRUNCATE TABLE
  option_personality_scores,
  options,
  questions,
  personalities
RESTART IDENTITY CASCADE;

-- -----------------------------------------
-- PERSONALITIES
-- -----------------------------------------
INSERT INTO personalities (id, code, name, description) VALUES
(1, 'ANALYST',   'The Analyst',   'Logical, data-driven, and analytical'),
(2, 'LEADER',    'The Leader',    'Confident, decisive, and assertive'),
(3, 'CREATIVE',  'The Creative',  'Innovative, imaginative, and creative'),
(4, 'SUPPORTER', 'The Supporter', 'Empathetic, dependable, and supportive');

-- -----------------------------------------
-- QUESTIONS
-- -----------------------------------------
INSERT INTO questions (id, question_text, weight, order_index, dimension) VALUES
(1, 'I prefer planning things in advance rather than being spontaneous.', 3, 1, 'conscientiousness'),
(2, 'I feel comfortable taking the lead in group situations.',            4, 2, 'extraversion'),
(3, 'I enjoy solving complex problems using logic and data.',             5, 3, 'openness'),
(4, 'I like expressing myself through creative activities.',              4, 4, 'openness'),
(5, 'I prioritize helping others over achieving personal goals.',         3, 5, 'agreeableness'),
(6, 'I stay calm and focused under pressure.',                            4, 6, 'neuroticism'),
(7, 'I enjoy trying new ideas and experimenting.',                        3, 7, 'openness'),
(8, 'I prefer working independently rather than in a team.',              2, 8, 'extraversion');

-- -----------------------------------------
-- OPTIONS (LIKERT SCALE)
-- -----------------------------------------
INSERT INTO options (id, question_id, option_text, order_index) VALUES
(1, 1, 'Strongly Agree', 1),
(2, 1, 'Agree', 2),
(3, 1, 'Neutral', 3),
(4, 1, 'Disagree', 4),
(5, 1, 'Strongly Disagree', 5),

(6, 2, 'Strongly Agree', 1),
(7, 2, 'Agree', 2),
(8, 2, 'Neutral', 3),
(9, 2, 'Disagree', 4),
(10, 2, 'Strongly Disagree', 5),

(11, 3, 'Strongly Agree', 1),
(12, 3, 'Agree', 2),
(13, 3, 'Neutral', 3),
(14, 3, 'Disagree', 4),
(15, 3, 'Strongly Disagree', 5),

(16, 4, 'Strongly Agree', 1),
(17, 4, 'Agree', 2),
(18, 4, 'Neutral', 3),
(19, 4, 'Disagree', 4),
(20, 4, 'Strongly Disagree', 5),

(21, 5, 'Strongly Agree', 1),
(22, 5, 'Agree', 2),
(23, 5, 'Neutral', 3),
(24, 5, 'Disagree', 4),
(25, 5, 'Strongly Disagree', 5),

(26, 6, 'Strongly Agree', 1),
(27, 6, 'Agree', 2),
(28, 6, 'Neutral', 3),
(29, 6, 'Disagree', 4),
(30, 6, 'Strongly Disagree', 5),

(31, 7, 'Strongly Agree', 1),
(32, 7, 'Agree', 2),
(33, 7, 'Neutral', 3),
(34, 7, 'Disagree', 4),
(35, 7, 'Strongly Disagree', 5),

(36, 8, 'Strongly Agree', 1),
(37, 8, 'Agree', 2),
(38, 8, 'Neutral', 3),
(39, 8, 'Disagree', 4),
(40, 8, 'Strongly Disagree', 5);

-- -----------------------------------------
-- OPTION → PERSONALITY SCORES
-- (EXACT COPY FROM SUPABASE)
-- -----------------------------------------
INSERT INTO option_personality_scores (option_id, personality_id, points) VALUES
(1,1,2),(1,2,1),(1,3,-1),(1,4,0),
(2,1,1),(2,2,1),(2,3,-1),(2,4,0),
(3,1,0),(3,2,0),(3,3,0),(3,4,0),
(4,1,-1),(4,2,0),(4,3,1),(4,4,0),
(5,1,-2),(5,2,-1),(5,3,2),(5,4,0),

(6,1,0),(6,2,2),(6,3,1),(6,4,0),
(7,1,0),(7,2,1),(7,3,1),(7,4,0),
(8,1,0),(8,2,0),(8,3,0),(8,4,0),
(9,1,0),(9,2,-1),(9,3,0),(9,4,1),
(10,1,0),(10,2,-2),(10,3,-1),(10,4,2),

(11,1,2),(11,2,1),(11,3,0),(11,4,0),
(12,1,1),(12,2,1),(12,3,0),(12,4,0),
(13,1,0),(13,2,0),(13,3,0),(13,4,0),
(14,1,-1),(14,2,0),(14,3,1),(14,4,0),
(15,1,-2),(15,2,-1),(15,3,2),(15,4,0),

(21,1,0),(21,2,-1),(21,3,0),(21,4,2),
(22,1,0),(22,2,0),(22,3,0),(22,4,1),
(23,1,0),(23,2,0),(23,3,0),(23,4,0),
(24,1,1),(24,2,1),(24,3,0),(24,4,-1),
(25,1,2),(25,2,2),(25,3,1),(25,4,-2),

(26,1,1),(26,2,2),(26,3,0),(26,4,1),
(27,1,0),(27,2,1),(27,3,0),(27,4,1),
(28,1,0),(28,2,0),(28,3,0),(28,4,0),
(29,1,0),(29,2,-1),(29,3,0),(29,4,-1),
(30,1,-1),(30,2,-2),(30,3,0),(30,4,-2);

COMMIT;