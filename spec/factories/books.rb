FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    author { Faker::Book.author }
    isbn { Faker::Code.isbn(base: 13) }
    description { Faker::Lorem.paragraph }

    trait :invalid do
      title { '' }
    end
  end
end
