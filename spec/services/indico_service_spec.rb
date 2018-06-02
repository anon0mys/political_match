require 'rails_helper'

describe IndicoService do
  context 'political analysis' do
    it 'can determine liberal text' do
      VCR.use_cassette('indico-liberal-service') do
        survey = {
          question_1: 'This is a liberal response',
          question_2: 'This is a liberal response'
        }

        service = IndicoService.new(survey)

        response = service.analyze
        results = response[:results]

        expect(results).to be_an Array
        expect(results.first).to be_a Hash
        expect(results.first.keys.first).to eq(:Liberal)
      end
    end

    it 'can determine conservative text' do
      VCR.use_cassette('indico-conservative-service') do
        survey = {
          question_1: 'This is a conservative response',
          question_2: 'This is a conservative response'
        }

        service = IndicoService.new(survey)

        response = service.analyze
        results = response[:results]

        expect(results).to be_an Array
        expect(results.first).to be_a Hash
        expect(results.first.keys.first).to eq(:Conservative)
      end
    end
  end
end
