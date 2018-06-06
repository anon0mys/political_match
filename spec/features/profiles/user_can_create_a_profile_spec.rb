require 'rails_helper'

feature 'A logged in User' do
  scenario 'can create a profile' do
    VCR.use_cassette('indico-profile') do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit new_user_profile_path(user)

      select 'This is a liberal response', from: 'question_1'
      select 'This is a liberal conservative response', from: 'question_2'
      select 'Libertarian', from: 'party'

      click_on 'Submit'

      expect(current_path).to eq('/dashboard')
      within '.profile' do
        expect(page).to have_content('Your political types:')
      end
    end
  end
end
