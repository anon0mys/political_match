require 'rails_helper'

feature 'A logged in User' do
  scenario 'can create a profile' do
    VCR.use_cassette('indico-profile') do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit new_user_profile_path(user)

      find(:select, 'question_1').first('option').select_option
      find(:select, 'question_2').first('option').select_option
      find(:select, 'question_3').first('option').select_option
      find(:select, 'question_4').first('option').select_option
      find(:select, 'question_5').first('option').select_option
      find(:select, 'question_6').first('option').select_option
      find(:select, 'question_8').first('option').select_option
      find(:select, 'question_9').first('option').select_option
      find(:select, 'question_10').first('option').select_option
      find(:select, 'question_11').first('option').select_option
      find(:select, 'question_12').first('option').select_option
      find(:select, 'question_13').first('option').select_option
      find(:select, 'question_14').first('option').select_option
      find(:select, 'question_15').first('option').select_option
      find(:select, 'question_16').first('option').select_option

      select 'Libertarian', from: 'party'

      click_on 'Submit'

      expect(current_path).to eq('/dashboard')
      within '.profile-container' do
        expect(page).to have_content('Your political types:')
      end
    end
  end
end
