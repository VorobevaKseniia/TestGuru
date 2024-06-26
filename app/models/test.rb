class Test < ApplicationRecord
  has_many :test_passages, dependent: :delete_all
  has_many :users, through: :test_passages
  has_many :questions
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :user_id, optional: true

  scope :simple_tests, -> {where(level: 0..1)}
  scope :medium_tests, -> {where(level: 2..4)}
  scope :complex_tests, -> {where(level: 5..Float::INFINITY)}

  scope :complete_tests, -> { where(completed: true) }

  scope :categorized_tests, -> (category) { joins(:category).where(category: { title: category }) }

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, in: 0..Float::INFINITY }


  def self.sort_by_category(category)
    categorized_tests(category).order(title: :desc).pluck(:title)
  end

end