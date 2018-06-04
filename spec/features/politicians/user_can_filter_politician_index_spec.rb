require 'rails_helper'

feature 'A logged in user' do
  context 'on /politicians' do
    before(:each) do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end

    scenario 'can see a a list of politicians and summary information' do
      attributes =  { first_name: 'Name',
                      last_name: 'Lastname',
                      title: 'Representative',
                      party: 'D',
                      twitter_account: 'twitterhandle',
                      state: 'CO',
                      propublica_id: 'A000374' }

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

    context 'with the parameter ?chamber=senate' do
      scenario 'can see a list of senators' do
        create_list(:politician, 6, title: 'Senator, 1st Class')
        create_list(:politician, 6, title: 'Senator, 2nd Class')
        create_list(:politician, 1, first_name: 'Reps', title: 'Representative')

        visit '/politicians?chamber=senate'

        expect(page).to have_css('.politician-card', count: 12)
        expect(page).to_not have_content('Reps')
      end
    end

    context 'with the parameter ?chamber=house' do
      scenario 'can see a list of representatives' do
        create_list(:politician, 5, title: 'Representative')
        create_list(:politician, 5, title: 'Delegate')
        create_list(:politician, 1, first_name: 'Sena-tor', title: 'Senator, 1st Class')

        visit '/politicians?chamber=house'

        expect(page).to have_css('.politician-card', count: 10)
        expect(page).to_not have_content('Sena-tor')
      end
    end
  end
end
