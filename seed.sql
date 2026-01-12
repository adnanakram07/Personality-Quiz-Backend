-- =========================
-- Seed data for Personality Quiz
-- =========================

-- Clean existing data
TRUNCATE TABLE
  option_personality_scores,
  options,
  questions,
  personalities
RESTART IDENTITY CASCADE;

-- =========================
-- Personalities
-- =========================
INSERT INTO personalities (code, name, description) VALUES
('ANALYST', 'The Analyst', 'Logical, data-driven thinker'),
('LEADER', 'The Leader', 'Confident and decisive'),
('CREATIVE', 'The Creative', 'Imaginative and innovative'),
('SUPPORTER', 'The Supporter', 'Empathetic and collaborative');

-- =========================
-- Questions
-- =========================
INSERT INTO questions (question_text, weight) VALUES
('How do you approach problem solving?', 5),
('How do you behave in a team?', 4),
('What motivates you the most?', 4),
('How do you handle pressure?', 5),
('How do you make decisions?', 3),
('How creative do you consider yourself?', 2),
('How do you support others?', 3),
('What is your leadership style?', 4);

-- =========================
-- Options
-- =========================
INSERT INTO options (question_id, option_text, order_index) VALUES
(1, 'Analyze data and facts', 1),
(1, 'Take charge and decide quickly', 2),
(1, 'Think creatively', 3),

(2, 'Support the team quietly', 1),
(2, 'Lead discussions', 2),
(2, 'Share new ideas', 3),

(3, 'Solving complex problems', 1),
(3, 'Achieving goals', 2),
(3, 'Creating something new', 3),

(4, 'Stay calm and logical', 1),
(4, 'Take control', 2),
(4, 'Adapt creatively', 3),

(5, 'With careful analysis', 1),
(5, 'With confidence', 2),
(5, 'With intuition', 3),

(6, 'Not very creative', 1),
(6, 'Somewhat creative', 2),
(6, 'Highly creative', 3),

(7, 'By listening and helping', 1),
(7, 'By leading', 2),
(7, 'By inspiring', 3),

(8, 'Strategic', 1),
(8, 'Authoritative', 2),
(8, 'Visionary', 3);

-- =========================
-- Option → Personality Scores
-- =========================
INSERT INTO option_personality_scores (option_id, personality_id, points) VALUES
(1, 1, 2),
(2, 2, 2),
(3, 3, 2),

(4, 4, 2),
(5, 2, 2),
(6, 3, 2),

(7, 1, 2),
(8, 2, 2),
(9, 3, 2),

(10, 1, 2),
(11, 2, 2),
(12, 3, 2),

(13, 1, 2),
(14, 2, 2),
(15, 3, 2),

(16, 4, 1),
(17, 3, 1),
(18, 3, 2),

(19, 4, 2),
(20, 2, 1),
(21, 3, 1),

(22, 1, 2),
(23, 2, 2),
(24, 3, 2);-- =========================
-- Seed data for Personality Quiz
-- =========================

-- Clean existing data
TRUNCATE TABLE
  option_personality_scores,
  options,
  questions,
  personalities
RESTART IDENTITY CASCADE;

-- =========================
-- Personalities
-- =========================
INSERT INTO personalities (code, name, description) VALUES
('ANALYST', 'The Analyst', 'Logical, data-driven thinker'),
('LEADER', 'The Leader', 'Confident and decisive'),
('CREATIVE', 'The Creative', 'Imaginative and innovative'),
('SUPPORTER', 'The Supporter', 'Empathetic and collaborative');

-- =========================
-- Questions
-- =========================
INSERT INTO questions (question_text, weight) VALUES
('How do you approach problem solving?', 5),
('How do you behave in a team?', 4),
('What motivates you the most?', 4),
('How do you handle pressure?', 5),
('How do you make decisions?', 3),
('How creative do you consider yourself?', 2),
('How do you support others?', 3),
('What is your leadership style?', 4);

-- =========================
-- Options
-- =========================
INSERT INTO options (question_id, option_text, order_index) VALUES
(1, 'Analyze data and facts', 1),
(1, 'Take charge and decide quickly', 2),
(1, 'Think creatively', 3),

(2, 'Support the team quietly', 1),
(2, 'Lead discussions', 2),
(2, 'Share new ideas', 3),

(3, 'Solving complex problems', 1),
(3, 'Achieving goals', 2),
(3, 'Creating something new', 3),

(4, 'Stay calm and logical', 1),
(4, 'Take control', 2),
(4, 'Adapt creatively', 3),

(5, 'With careful analysis', 1),
(5, 'With confidence', 2),
(5, 'With intuition', 3),

(6, 'Not very creative', 1),
(6, 'Somewhat creative', 2),
(6, 'Highly creative', 3),

(7, 'By listening and helping', 1),
(7, 'By leading', 2),
(7, 'By inspiring', 3),

(8, 'Strategic', 1),
(8, 'Authoritative', 2),
(8, 'Visionary', 3);

-- =========================
-- Option → Personality Scores
-- =========================
INSERT INTO option_personality_scores (option_id, personality_id, points) VALUES
(1, 1, 2),
(2, 2, 2),
(3, 3, 2),

(4, 4, 2),
(5, 2, 2),
(6, 3, 2),

(7, 1, 2),
(8, 2, 2),
(9, 3, 2),

(10, 1, 2),
(11, 2, 2),
(12, 3, 2),

(13, 1, 2),
(14, 2, 2),
(15, 3, 2),

(16, 4, 1),
(17, 3, 1),
(18, 3, 2),

(19, 4, 2),
(20, 2, 1),
(21, 3, 1),

(22, 1, 2),
(23, 2, 2),
(24, 3, 2);