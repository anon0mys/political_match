require 'rails_helper'

feature 'On the Dashboard Page' do
  context 'a logged in user' do
    scenario 'can see their demographics information' do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit '/dashboard'

      expect(page).to have_content('Profile Information')
    end
  end
end
