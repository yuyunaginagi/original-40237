class Review < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  validates :date, presence: true
  validates :activity, presence: true
  validates :review, presence: true
end
