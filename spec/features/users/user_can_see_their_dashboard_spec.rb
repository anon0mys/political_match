require 'rails_helper'

feature 'On the Dashboard Page' do
  context 'a logged in user' do
    scenario 'can see their demographics information' do
      create(:user)

      visit '/dashboard'

      expect(page).to have_content()
    end
  end
end
