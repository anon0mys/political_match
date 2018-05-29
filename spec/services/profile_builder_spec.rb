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

    it 'initializes with params and a service' do
      expect(subject.params).to eq(attributes)
      expect(subject.service).to be_a IndicoService
    end
  end

  context '#results' do
    let(:attributes) {
      {
        question_1: 'This is a liberal response',
        question_2: 'This is a liberal response'
      }
    }
    subject { ProfileBuilder.new(attributes) }

    it 'should analyze survey answers' do
      stub_request(:post, 'https://apiv2.indico.io/political/batch')
        .to_return(body: './spec/fixtures/json/liberal_survey.json')

      expect(subject.results).to eq('')
    end
  end
end
