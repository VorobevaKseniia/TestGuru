class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions
  has_many :user_tests

  scope :simple_tests, -> {where(level: 0..1)}
  scope :medium_tests, -> {where(level: 2..4)}
  scope :complex_tests, -> {where(level: 5..Float::INFINITY)}

  scope :sort_by_category, -> (category) do joins(:category)
                                              .where(category: { title: category })
                                              .order(title: :desc).pluck(:title)
  end

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, in: 0..Float::INFINITY }


  # def self.sort_by_category(category)
  #   joins(:category).where(category: { title: category }).order(title: :desc).pluck(:title)
  # end

end
