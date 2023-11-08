class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :answers_count, on: :create

  scope :correct, -> { where(correct: true) }
  def answers_count
    errors.add(:base, "A question can have only 4 answers") if question.answers.count > 4
  end
end
