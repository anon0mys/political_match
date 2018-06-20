require 'rails_helper'

feature 'A User can sign up' do
  scenario 'and it creates an account' do
    visit sign_up_path

    fill_in 'user[name]', with: 'Test'
    fill_in 'user[email]', with: 'test@mail.com'
    select 'Colorado', from: 'user[state]'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'

    click_on 'Sign Up'

    expect(current_path).to eq(dashboard_path)

    within '.flash' do
      expect(page).to have_content('Account successfully created')
    end

    expect(page).to have_content('Welcome, Test')

    expect(page).to have_button('Create Your Profile')
  end
end
