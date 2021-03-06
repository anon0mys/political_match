require 'rails_helper'

describe ProfileMatcher do
  context 'intialize' do
    it 'initializes with a user' do
    end
  end

  context 'instance methods' do
    context '#best_matches' do
      it 'returns the top three politician matches' do
        user = create(:user_with_profile)
        political_type = user.profile.political_type
        auth_rating = user.profile.authority_rating
        soc_rating = user.profile.social_rating

        create_list(:politician_with_profile, 20)
        4.times do
          create(:politician, profile: create(:profile, political_type: political_type, authority_rating: auth_rating, social_rating: soc_rating))
        end

        matcher = ProfileMatcher.new(user)

        expect(matcher.political_matches.count).to eq(3)
        expect(matcher.political_matches.first).to be_a ProfilePresenter
        expect(matcher.political_matches.last).to be_a ProfilePresenter
      end
    end
  end
end
