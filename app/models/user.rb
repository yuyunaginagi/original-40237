class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,  presence: true
  validates :birth_day, presence: true
  validates :event, presence: true
  validates :goal, presence: true

  has_many :results
  has_many :reviews
  has_many :comments
  has_many :likes
  
end
