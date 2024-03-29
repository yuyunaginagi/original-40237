FactoryBot.define do
  factory :result do
    date             {'2000-12-12'}
    game_name        {Faker::Name.initials(number: 4)}
    event_id         { (Event.pluck(:id) - [1]).sample }
    result           { '9.89秒' }
    association :user
  end
end
