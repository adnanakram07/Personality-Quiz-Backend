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
INSERT INTO questions (question_text, weight, order_index, dimension) VALUES
('How do you approach problem solving?', 5, 1, 'logic'),
('How do you behave in a team?', 4, 2, 'leadership'),
('What motivates you the most?', 4, 3, 'drive'),
('How do you handle pressure?', 5, 4, 'resilience'),
('How do you make decisions?', 3, 5, 'decision_making'),
('How creative do you consider yourself?', 2, 6, 'creativity'),
('How do you support others?', 3, 7, 'empathy'),
('What is your leadership style?', 4, 8, 'leadership');

-- =========================
-- Options
-- =========================
INSERT INTO options (question_id, option_text, order_index) VALUES
-- Q1
(1, 'Analyze data and facts', 1),
(1, 'Take charge and decide quickly', 2),
(1, 'Think creatively', 3),

-- Q2
(2, 'Support the team quietly', 1),
(2, 'Lead discussions', 2),
(2, 'Share new ideas', 3),

-- Q3
(3, 'Solving complex problems', 1),
(3, 'Achieving goals', 2),
(3, 'Creating something new', 3),

-- Q4
(4, 'Stay calm and logical', 1),
(4, 'Take control', 2),
(4, 'Adapt creatively', 3),

-- Q5
(5, 'With careful analysis', 1),
(5, 'With confidence', 2),
(5, 'With intuition', 3),

-- Q6
(6, 'Not very creative', 1),
(6, 'Somewhat creative', 2),
(6, 'Highly creative', 3),

-- Q7
(7, 'By listening and helping', 1),
(7, 'By leading', 2),
(7, 'By inspiring', 3),

-- Q8
(8, 'Strategic', 1),
(8, 'Authoritative', 2),
(8, 'Visionary', 3);

-- =========================
-- Option → Personality Scores
-- =========================
INSERT INTO option_personality_scores (option_id, personality_id, points) VALUES
-- Q1
(1, 1, 3),    -- analyst strong +
(2, 2, 2),    -- leader +
(3, 3, 1),    -- creative +

-- Q2
(4, 4, 3),    -- supporter strong +
(5, 2, 2),    -- leader +
(6, 3, -1),   -- creative slightly -

-- Q3
(7, 1, 2),    -- analyst +
(8, 2, 3),    -- leader strong +
(9, 3, -1),   -- creative -

-- Q4
(10, 1, 3),   -- analyst strong +
(11, 2, 1),   -- leader small +
(12, 3, -2),  -- creative strong -

-- Q5
(13, 1, 2),   -- analyst +
(14, 2, 3),   -- leader strong +
(15, 3, -1),  -- creative -

-- Q6
(16, 4, -2),  -- supporter strong -
(17, 3, 1),   -- creative +
(18, 3, 3),   -- creative strong +

-- Q7
(19, 4, 3),   -- supporter strong +
(20, 2, -1),  -- leader -
(21, 3, 1),   -- creative +

-- Q8
(22, 1, 1),   -- analyst +
(23, 2, 3),   -- leader strong +
(24, 3, -2);  -- creative strong -