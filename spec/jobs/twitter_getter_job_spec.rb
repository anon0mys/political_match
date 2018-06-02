require 'rails_helper'

describe TwitterGetterJob do
  context '#perform' do
    it 'should update all politician profiles' do
      VCR.use_cassette('twitter-list-service') do
        before_update = create(:politician)

        expect(before_update.profile).to be nil

        indico_response = File.read('./spec/fixtures/json/liberal_survey.json')

        stub_request(:post, 'https://apiv2.indico.io/political/batch')
          .to_return(body: indico_response)

        TwitterGetterJob.perform_now

        after_update = Politician.find(1)

        expect(after_update.profile).to be_a Profile
      end
    end
  end
end
