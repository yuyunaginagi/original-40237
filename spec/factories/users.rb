FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birth_day             {'2000-12-12'}
    event                 {'1500m'}
    goal                  {'テスト'}
  end
end