require 'rails_helper'

describe TwitterGetterJob do
  context '#perform' do
    let(:attributes) {
      {
        name: 'Test',
        role: 'test',
        gender: 'test',
        party: 'test',
        twitter_id: 'RepDianaDeGette',
        facebook_account: 'test',
        next_election: 'test',
        profile: nil
      }
    }

    it 'should update all politician profiles' do
      before_update = Politician.create(attributes)

      expect(before_update.profile).to be nil

      TwitterGetterJob.perform_now

      after_update = Politician.find(1)

      expect(after_update.profile).to be_a Profile
    end
  end
end
