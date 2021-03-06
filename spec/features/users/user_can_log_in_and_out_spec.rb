require 'rails_helper'

feature 'User sessions' do
  context 'when logged out' do
    scenario 'a user cannot see the dashboard' do
    end

    scenario 'a user can log in' do
      user = create(:user)
      visit root_path

      click_on 'Log In'

      expect(current_path).to eq(login_path)

      fill_in 'email', with: user.email
      fill_in 'password', with: 'password'

      within '.login-form' do
        click_on 'Log In'
      end

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Welcome, #{user.name}")
    end
  end

  context 'when logged in' do
    scenario 'a user can log out' do
      user = create(:user)

      visit login_path

      fill_in 'email', with: user.email
      fill_in 'password', with: 'password'

      within '.login-form' do
        click_on 'Log In'
      end

      expect(current_path).to eq(dashboard_path)

      click_on 'Log Out'

      expect(current_path).to eq(root_path)
      expect(page).to have_content('Successfully logged out')
    end
  end
end
