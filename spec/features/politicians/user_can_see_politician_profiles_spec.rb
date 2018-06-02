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
        state: 'CO'
      }
    }

    scenario 'can see a list of politicians' do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      create(:politician, attributes)
      create_list(:politician, 12)

      visit '/politicians'

      expect(page).to have_css('.politician-card', count: 12)

      within first('.politician-card') do
        expect(page).to have_content('Name')
        expect(page).to have_content('Lastname')
        expect(page).to have_content('Congressperson')
        expect(page).to have_content('D')
        expect(page).to have_content('twitterhandle')
        expect(page).to have_content('CO')
      end
    end
  end

  context 'on a /politicians show page' do
    scenario 'can see that politician\'s information' do
    end

    scenario 'can see that politician\'s political profile' do
    end

    scenario 'can see that politician\'s political profile' do
    end
  end
end
