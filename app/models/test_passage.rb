class TestPassage < ApplicationRecord

  TEST_THRESHOLD = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update -> {self.current_question = next_question}

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def completed?
    current_question.nil?
  end

  def time_out?
    (Time.now - self.created_at) / 60 >= test.timer
  end

  def remaining_time
    (test.timer * 60) - (Time.now - self.created_at)
  end

  def question_number
    test.questions.find_index(current_question) + 1
  end

  def result
    (100*self.correct_questions)/self.test.questions.count
  end

  def passed?
    self.result >= TEST_THRESHOLD
  end

  private
  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count

    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first if current_question
  end

end
