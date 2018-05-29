require 'rails_helper'

feature 'A logged in User' do
  scenario 'can create a profile' do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    response = File.read('./spec/fixtures/json/mixed_survey.json')

    stub_request(:post, 'https://apiv2.indico.io/political/batch')
      .to_return(body: response)

    visit new_user_profile_path(user)

    select 'This is a liberal response', from: 'question_1'
    select 'This is a liberal conservative response', from: 'question_2'

    click_on 'Submit'

    expect(current_path).to eq('/dashboard')
    within '.profile' do
      expect(page).to have_content('Your summary:')
      expect(page).to have_content('Liberal: 46.0%')
      expect(page).to have_content('Conservative: 26.0%')
    end
  end
end
