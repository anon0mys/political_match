require 'rails_helper'

feature 'A user with a profile' do
  context 'on their dashboard' do
    scenario 'can see their top three matches' do
      skip "Need selenium or phantom js to test fetch call"
      user = create(:user_with_profile)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/dashboard'


    end
  end
end
