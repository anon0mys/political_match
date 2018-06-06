require 'rails_helper'

describe 'Api::V1::Matches' do
  context 'GET /api/v1/matches' do
    it 'returns an array of matches' do
      user = create(:user_with_profile)
      allow_any_instance_of(ApiController).to receive(:current_user).and_return(user)

      preferred_party = user.profile.preferred_party
      political_type = user.profile.political_type

      politicians = []
      3.times do
        politicians << create(:politician, profile: create(:profile, political_type: political_type, preferred_party: preferred_party))
      end

      expected = politicians.map do |politician|
        ProfilePresenter.new(politician, politician.profile)
      end.to_json

      get '/api/v1/matches'

      expect(response).to be_success
    end
  end
end
