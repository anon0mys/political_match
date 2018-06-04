require 'rails_helper'

feature 'A logged in user' do
  context 'on /politicians' do
    let(:attributes) {
      {
        first_name: 'Name',
        last_name: 'Lastname',
        title: 'Congressperson',
        party: 'D',
        twitter_account: 'twitterhandle',
        state: 'CO',
        propublica_id: 'A000374'
      }
    }

    scenario 'can see a list of politicians' do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      politician = create(:politician, attributes)
      create_list(:politician, 11)

      visit '/politicians'

      expect(page).to have_css('.politician-card', count: 12)

      within first('.politician-card') do
        expect(page).to have_content(politician.title)
        expect(page).to have_content(politician.last_name)
        expect(page).to have_content(politician.party)
        expect(page).to have_content(politician.state)
      end
    end
  end

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
        new_politician = create(:politician_with_profile, attributes)

        visit '/politicians/1'

        expected = 'Liberal: 40.42 Conservative: 25.68'

        expect(page).to have_content(expected)
      end
    end
  end
end