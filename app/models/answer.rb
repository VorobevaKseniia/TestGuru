class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :answers_count, on: create

  def answers_count
    errors.add :base, "a question can have only 4 answers" if question.answers.count > 4
  end
end
