FactoryBot.define do
  factory :profile do
    overall "{\"Liberal\":40.42,\"Conservative\":25.68}"
    association :owner, factory: :user
  end
end
