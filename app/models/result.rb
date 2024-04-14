class Result < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :event

  validates :date, presence: true
  validates :game_name, presence: true
  validates :event_id, numericality: { other_than: 1, message: "を選んでください" }
  validates :result, presence: true
end