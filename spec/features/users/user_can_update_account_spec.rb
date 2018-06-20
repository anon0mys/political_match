require 'rails_helper'

feature 'A User' do
  context 'with an account' do
    scenario 'can update their information' do
      user = create(:user_with_profile)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit dashboard_path

      click_on 'Account Information'

      fill_in 'user[name]', with: 'Test Change'
      fill_in 'user[email]', with: 'test@mail.com'
      select 'Colorado', from: 'user[state]'

      click_on 'Update'

      expect(current_path).to eq(dashboard_path)

      within '.flash' do
        expect(page).to have_content('Account successfully updated')
      end

      expect(page).to have_content('Test Change')
    end
  end
end
