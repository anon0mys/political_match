FactoryBot.define do
  factory :politician do
    first_name 'First name'
    last_name 'Last name'
    title 'Title'
    party 'Party'
    twitter_account 'Twitter'
    state 'State'
    govtrack_id 101
  end

  factory :politician_with_profile, parent: :politician do
    association :profile
  end
end
