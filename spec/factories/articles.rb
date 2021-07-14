require 'faker'

FactoryBot.define do
  factory :article do
    title { "Sample article title" }
    content { "Sample content" }
    slug { Faker::Internet.unique.slug }
  end
end
