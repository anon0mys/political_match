require 'rails_helper'

describe ProfilePresenter do
  describe 'initialize' do
    it 'initializes with a profile' do
    end
  end

  describe 'instance methods' do
    context '#political_type' do
      it 'should return the political_type of a user' do
        user = create(:user_with_profile)
        presenter = ProfilePresenter.new(user, user.profile)

        expect(presenter.political_type).to eq(user.profile.political_type)

      end

      it 'should return the political_type of a politician' do
        politician = create(:politician_with_profile)
        presenter = ProfilePresenter.new(politician, politician.profile)

        expect(presenter.political_type).to eq(politician.profile.political_type)
      end
    end

    context '#preferred_party' do
      it 'should return the preferred_party of a user' do
        user = create(:user_with_profile)
        presenter = ProfilePresenter.new(user, user.profile)

        expect(presenter.preferred_party).to eq(user.profile.preferred_party)
      end

      it 'should return the preferred_party of a politician' do
        politician = create(:politician, profile: create(:profile, preferred_party: 'D'))
        presenter = ProfilePresenter.new(politician, politician.profile)

        expect(presenter.preferred_party).to eq('Democrat')
      end
    end

    context '#authority_rating' do
      it 'should return the authority_rating of a user' do
        user = create(:user_with_profile)
        presenter = ProfilePresenter.new(user, user.profile)

        expect(presenter.authority_rating).to eq(user.profile.authority_rating)
      end

      it 'should return the authority_rating of a politician' do
        politician = create(:politician_with_profile)
        presenter = ProfilePresenter.new(politician, politician.profile)

        expect(presenter.authority_rating).to eq(politician.profile.authority_rating)
      end
    end

    context '#social_rating' do
      it 'should return the social_rating of a user' do
        user = create(:user_with_profile)
        presenter = ProfilePresenter.new(user, user.profile)

        expect(presenter.social_rating).to eq(user.profile.social_rating)
      end

      it 'should return the social_rating of a politician' do
        politician = create(:politician_with_profile)
        presenter = ProfilePresenter.new(politician, politician.profile)

        expect(presenter.social_rating).to eq(politician.profile.social_rating)
      end
    end

    context '#overall' do
      it 'should return the overall stats of a user' do
        user = create(:user_with_profile)
        presenter = ProfilePresenter.new(user, user.profile)

        expected = JSON.parse(user.profile.overall)

        expect(presenter.overall).to eq(expected)
      end

      it 'should return the overall stats of a politician' do
        politician = create(:politician_with_profile)
        presenter = ProfilePresenter.new(politician, politician.profile)

        expected = JSON.parse(politician.profile.overall)

        expect(presenter.overall).to eq(expected)
      end
    end
  end
end
