FactoryBot.define do
  factory :user do
    nickname {Fakker::Name.nickname}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
  end
end