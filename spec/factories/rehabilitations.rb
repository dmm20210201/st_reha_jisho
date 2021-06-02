FactoryBot.define do
  factory :rehabilitation do
    training_name { Faker::Lorem.characters(number:5) }
    speech_pathological_findings { Faker::Lorem.characters(number:5) }
    adaptation_precautions { Faker::Lorem.characters(number:10) }
    items { Faker::Lorem.characters(number:10) }
    training_content { Faker::Lorem.characters(number:30) }
    user
  end
end