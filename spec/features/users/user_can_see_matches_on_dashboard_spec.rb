require 'rails_helper'

feature 'A user with a profile' do
  context 'on their dashboard' do
    scenario 'can see their top three matches' do
      skip 'Need selenium or phantom js to test fetch'
      user = create(:user_with_profile)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/dashboard'

      sleep 0.5

      within '.best-matches' do
        expect(page).to have_css('.best-matches-card', count: 3)
      end
    end
  end
end
