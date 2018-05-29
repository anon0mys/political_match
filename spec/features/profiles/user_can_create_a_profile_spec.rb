require 'rails_helper'

feature 'A logged in User' do
  scenario 'can create a profile' do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit new_user_profile_path(user)

    select 'This is a liberal response', from: 'question_1'

    click_on 'Submit'

    expect(current_path).to eq('/dashboard')
    within '.profile' do
      expect(page).to have_content('You agree most with:')
      expect(page).to have_content('Solid Liberals')
    end
  end
end
