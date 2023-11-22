FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    author { Faker::Book.author }
    isbn { Faker::Code.isbn(base: 13) }
    description { Faker::Lorem.paragraph }

    trait :invalid do
      title { '' }
    end

    trait :with_attached_cover do
      cover { Rack::Test::UploadedFile.new("spec/support/files/cover.jpg", "image/jpeg") }
    end

    trait :with_attached_content do
      content { Rack::Test::UploadedFile.new("spec/support/files/sample_content.pdf", "application/pdf") }
    end
  end
end
