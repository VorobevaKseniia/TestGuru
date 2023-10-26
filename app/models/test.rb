class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user, -> { where status: :admin}
  has_many :questions
  has_many :user_tests
  has_many :users, through: :user_tests


  def self.sort_by_category(category)
    joins(:category).where(category: { title: category }).order(title: :desc).pluck(:title)
  end

end
