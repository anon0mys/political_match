require 'rails_helper'

describe ProfileBuilder do
  context 'initialize' do
    let(:attributes) {
      {
        question_1: 'This is a Liberal response',
        question_2: 'This is a Liberal response'
      }
    }
    subject { ProfileBuilder.new(attributes) }

    it 'initializes with a service' do
      expect(subject.service).to be_a IndicoService
    end
  end

  context '#results' do
    let(:attributes) {
      {
        question_1: 'This is a liberal response',
        question_2: 'This is a liberal conservative response'
      }
    }
    subject { ProfileBuilder.new(attributes) }

    it 'should analyze survey answers' do
      response = File.read('./spec/fixtures/json/mixed_survey.json')
      stub_request(:post, 'https://apiv2.indico.io/political/batch')
        .to_return(body: response)

      expected = { overall: "{\"Liberal\":0.46,\"Conservative\":0.26}"}

      expect(subject.results).to eq(expected)
    end
  end
end
