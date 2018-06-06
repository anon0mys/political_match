require 'rails_helper'

feature 'A logged in user' do
  context 'on a /politicians show page' do
    let(:attributes) {
      {
        first_name: 'Ralph',
        last_name: 'Abraham',
        title: 'Representative',
        party: 'R',
        twitter_account: 'RepAbraham',
        state: 'LA',
        propublica_id: 'A000374'
      }
    }

    before(:each) do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      @politician = create(:politician_with_profile, attributes)
    end

    scenario 'can see that politician\'s information' do
      VCR.use_cassette('propublica-member-votes-with-party') do
        visit '/politicians/1'

        expect(page).to have_content(@politician.title)
        expect(page).to have_content(@politician.first_name)
        expect(page).to have_content(@politician.last_name)
        expect(page).to have_content(@politician.party)
        expect(page).to have_content(@politician.state)

        within '.votes-with-party' do
          expect(page).to have_content('97.0%')
        end
      end
    end

    scenario 'can see that politician\'s political profile' do
      VCR.use_cassette('propublica-member-votes-with-party') do
        visit politician_path(@politician)

        expect(page).to have_css('.profile')
      end
    end
  end
end
