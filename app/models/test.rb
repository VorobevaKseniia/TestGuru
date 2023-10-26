class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions
  has_many :user_tests



  def self.sort_by_category(category)
    joins(:category).where(category: { title: category }).order(title: :desc).pluck(:title)
  end

end
