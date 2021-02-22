FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
   
    password {"aaa1111"}
    password_confirmation { password }
    last_name { '漢字' }
    first_name { '漢字' }
    last_name_kana { 'テスト' }
    first_name_kana { 'テスト' }
    birthday { '2020-01-01' }
  end
end
