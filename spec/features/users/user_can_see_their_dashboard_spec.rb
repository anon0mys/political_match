require 'rails_helper'

feature 'On the Dashboard Page' do
  context 'a logged in user' do
    scenario 'can see their demographics information if they completed a profile' do
      user = create(:user)
      survey = {
        question_1: 'This is a liberal response',
        question_2: 'This is a liberal response'
      }

      response = File.read('./spec/fixtures/json/liberal_survey.json')

      stub_request(:post, 'https://apiv2.indico.io/political/batch')
        .to_return(body: response)

      builder = ProfileBuilder.new(survey)
      user.create_profile(builder.results)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit '/dashboard'

      expect(page).to have_content('Political Profile:')
      expect(page).to have_content('Your political types:')
      expect(page).to have_content('Liberal: 45.56%')
    end
  end
end
