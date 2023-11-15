require 'digest/sha1'

class User < ApplicationRecord

  EMAIL_FORMAT = /\A\S+@[a-z]+\.[a-z]+\z/

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id'

  validates :name, presence: true
  validates :email, presence: true, format: { with: EMAIL_FORMAT }, uniqueness: true

  has_secure_password

  def list_of_tests(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end