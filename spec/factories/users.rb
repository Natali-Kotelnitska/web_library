FactoryBot.define do
  factory :user do
   first_name { Faker::Name.first_name }
   last_name { Faker::Name.last_name }
   username { Faker::Internet.username(specifier: 4..20, special_characters: false) }
   email { Faker::Internet.email }
   password { Faker::Internet.password(specifier: 6..128) }

   trait :empty_first_name do
    first_name {""}
   end

  end
end
