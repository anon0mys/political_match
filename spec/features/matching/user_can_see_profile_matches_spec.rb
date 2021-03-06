require 'rails_helper'

feature 'A user with a profile' do
  context 'can visit /matches' do
    before(:each) do
      @user = create(:user_with_profile)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

    scenario 'and see the best matched politicians' do
      political_type = @user.profile.political_type
      auth_rating = @user.profile.authority_rating
      soc_rating = @user.profile.social_rating

      create_list(:politician_with_profile, 20)
      4.times do
        create(:politician, profile: create(:profile, political_type: political_type, authority_rating: auth_rating, social_rating: soc_rating))
      end

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
