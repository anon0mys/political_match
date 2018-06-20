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
        expect(page).to have_content('Indico Machine Learning')
        expect(page).to have_content('Congress Twitter Feeds')
      end
    end
  end
end
