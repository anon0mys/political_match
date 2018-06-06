require 'rails_helper'

describe ProfileBuilder do
  context 'initialize' do
    let(:attributes) {
      {
        question_1: 'This is a Liberal response',
        question_2: 'This is a Liberal response',
        party: 'Democrat'
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
        question_2: 'This is a liberal conservative response',
        party: 'Libertarian'
      }
    }
    subject { ProfileBuilder.new(attributes) }

    it 'should analyze survey answers' do
      VCR.use_cassette('indico-mixed-service') do
        expected = {:overall=>{:Libertarian=>15.26,
                               :Liberal=>34.480000000000004,
                               :Green=>17.55,
                               :Conservative=>32.71},
                    :preferred_party=>"Libertarian"}

        expect(subject.results).to eq(expected)
      end
    end
  end
end
