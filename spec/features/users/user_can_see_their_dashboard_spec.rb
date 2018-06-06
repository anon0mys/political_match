 require 'rails_helper'

feature 'On the Dashboard Page' do
  context 'a logged in user' do
    scenario 'can see their profile information if they completed a profile' do
      VCR.use_cassette('indico-liberal-service') do
        user = create(:user_with_profile)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        visit '/dashboard'

        expect(page).to have_content('Political Profile:')
        expect(page).to have_content('Your political types:')
        expect(page).to have_css('.type')
      end
    end
  end
end
