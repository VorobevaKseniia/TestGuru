class User < ApplicationRecord

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable

  EMAIL_FORMAT = /\A\S+@[a-z]+\.[a-z]+\z/

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id'
  has_many :users_badges
  has_many :badges, through: :users_badges, dependent: :destroy

  validates :email, format: { with: EMAIL_FORMAT }, uniqueness: true

  def list_of_tests(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end

end