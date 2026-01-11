-- 1. personalities
create table personalities (
  id bigserial primary key,
  code varchar unique not null,
  name varchar not null,
  description text,
  created_at timestamptz default now()
);

-- 2. questions
create table questions (
  id bigserial primary key,
  question_text text not null,
  weight int not null check (weight between 1 and 5),
  order_index int not null,
  created_at timestamptz default now()
);

-- 3. options
create table options (
  id bigserial primary key,
  question_id bigint references questions(id) on delete cascade,
  option_text varchar not null,
  order_index int not null
);

-- 4. option_personality_scores
create table option_personality_scores (
  id bigserial primary key,
  option_id bigint references options(id) on delete cascade,
  personality_id bigint references personalities(id) on delete cascade,
  points int not null
);

-- 5. quiz_attempts
create table quiz_attempts (
  id bigserial primary key,
  user_identifier varchar not null,
  created_at timestamptz default now()
);

-- 6. quiz_answers
create table quiz_answers (
  id bigserial primary key,
  quiz_attempt_id bigint references quiz_attempts(id) on delete cascade,
  question_id bigint references questions(id),
  option_id bigint references options(id)
);

-- 7. quiz_results
create table quiz_results (
  id bigserial primary key,
  quiz_attempt_id bigint references quiz_attempts(id) on delete cascade,
  personality_id bigint references personalities(id),
  score int not null
);
