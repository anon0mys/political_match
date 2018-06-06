FactoryBot.define do
  factory :profile do
    overall {
      { 'Liberal' => rand(5.0..90.0).round(1).to_s,
        'Conservative' => rand(5.0..90.0).round(1).to_s,
        'Green' => rand(5.0..90.0).round(1).to_s,
        'Libertarian' => rand(5.0..90.0).round(1).to_s}.to_json
    }
    political_type { rand(0..8) }
    preferred_party 'D'
    authority_rating { rand(0..10) }
    social_rating { rand(0..10) }
    association :owner, factory: :user
  end
end
