require 'rails_helper'

feature 'On the Dashboard Page' do
  context 'a logged in user' do
    scenario 'can see their demographics information if they completed a profile' do
      user = create(:user)
      survey = {
        question_1: 'This is a liberal response',
        question_2: 'This is a liberal response'
      }
      builder = ProfileBuilder.new(survey)
      user.create_profile(builder.results)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit '/dashboard'

      expect(page).to have_content('Profile Information')
      expect(page).to have_content('Your summary:')
      expect(page).to have_content('Liberal: 46.0%')
    end
  end
end
