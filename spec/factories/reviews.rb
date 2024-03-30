FactoryBot.define do
  factory :review do
    date             {'2024-3-30'}
    activity         { 'test' }
    review           { 'test' }
    association :user
  end
end
