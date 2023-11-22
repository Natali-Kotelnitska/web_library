FactoryBot.define do
  factory :user do
   first_name { Faker::Name.first_name }
   last_name { Faker::Name.last_name }
   username { Faker::Internet.username(specifier: 4..20) }
   email { Faker::Internet.email }
   password { Faker::Internet.password(min_length: 6, max_length: 20) }

    trait :invalid_username  do
      username { "" }
    end
  end
end
