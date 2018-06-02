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
      VCR.use_cassette('indico-liberal-service') do
        expect(subject.service).to be_a IndicoService
      end
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
      VCR.use_cassette('indico-mixed-service') do
        expected = { overall: "{\"Liberal\":40.42,\"Conservative\":25.68}"}

        expect(subject.results).to eq(expected)
      end
    end
  end
end
