# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    title { Faker::Lorem.sentence }
    summary { Faker::Lorem.paragraph }
    body { Faker::Lorem.paragraph }
  end
end
