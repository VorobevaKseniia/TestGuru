class Badge < ApplicationRecord

  has_many :users_badges, dependent: :destroy
  has_many :users, through: :users_badges, dependent: :destroy

  validates :title, presence: true
  validates :image_name, presence: true
  validates :rule, presence: true
  validates :rule_value, presence: true
end
