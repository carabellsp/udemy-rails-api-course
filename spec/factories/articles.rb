require 'faker'

FactoryBot.define do
  factory :article do
    sequence(:title) { |n| "Sample article #{n}" } # auto generate different titles using factorybot
    content { "Sample content" }
    slug { Faker::Internet.unique.slug }
  end
end
