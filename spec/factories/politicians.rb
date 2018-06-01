FactoryBot.define do
  factory :politician do
    first_name 'First name'
    last_name 'Last name'
    title 'Title'
    gender 'Gender'
    party 'Party'
    twitter_account 'Twitter'
    facebook_account 'Facebook'
    next_election 'Election year'
    state 'State'
    district 'District'
    votes_with_party_pct 80.0
  end
end
