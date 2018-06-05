require 'rails_helper'

feature 'A user with a profile' do
  context 'can visit /matches' do
    scenario 'and see the best matched politicians' do
      user = create(:user_with_profile)
      create_list(:politician_with_profile, 20)

      visit matches_path

      expect(page).to have_css('.best-matches-card', count: 3)

      within first('.best-matches-card') do
        expect(page).to have_css('.type')
      end
    end

    scenario 'and see how closely they match their state politicians' do
    end
  end
end
