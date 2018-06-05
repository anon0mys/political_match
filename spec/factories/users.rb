FactoryBot.define do
  factory :user do
    name "Test Name"
    email "test_name@mail.com"
    password "password"
  end

  factory :user_with_profile, parent: :user do
    association :profile
  end
end
