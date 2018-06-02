require 'rails_helper'

describe TwitterGetterJob do
  context '#perform' do
    it 'should update all politician profiles' do
      before_update = create(:politician)

      expect(before_update.profile).to be nil

      TwitterGetterJob.perform_now

      after_update = Politician.find(1)

      expect(after_update.profile).to be_a Profile
    end
  end
end
