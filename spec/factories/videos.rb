FactoryBot.define do
  factory :video do
    url { 'https://www.youtube.com/watch?v=nC1pVNLbFwY' }
    title { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    user
  end
end