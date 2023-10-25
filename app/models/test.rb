class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :user_tests
  has_many :users, through: :user_tests
  def self.sort_by_category(category)
    Test.joins("INNER JOIN categories ON categories.id = tests.category_id")
        .where(categories: { title: category }).order(title: :desc).pluck(:title)
  end
end
