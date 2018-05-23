require 'rails_helper'

feature 'User visits homepage' do
  context 'before logging in' do
    scenario 'they see sign up and log in links' do
      visit root_path

      expect(page).to have_button('Sign Up')
      expect(page).to have_link('Log In')
    end

    scenario 'they see the about us section' do
      visit root_path

      expect(page).to have_content('About Political Match')
      within('.about-us') do
        expect(page).to have_content('Political Pairing')
        expect(page).to have_content('Your Profile')
        expect(page).to have_content('Real Data')
      end
    end
  end
end
# As a User
# when I visit '/'
# then I see a button to 'Sign Up'
# and I see a link to 'Log In'
# and I see an about section
