class Review < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes, dependent: :destroy

  validates :date, presence: true
  validates :activity, presence: true
  validates :review, presence: true

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
