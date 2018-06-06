require 'rails_helper'

describe PoliticianPresenter do
  context 'should initialize' do
    it 'with valid objects' do
      politician = create(:politician)

      presenter = PoliticianPresenter.new(politician)

      expect(presenter.politician).to eq(politician)
      expect(presenter.service).to be_a PropublicaService
    end
  end

  context 'instance methods' do
    context '#votes_with_party' do
      it 'returns a single member\'s voting history' do
        VCR.use_cassette('propublica-member-votes-with-party') do
          politician = create(:politician, propublica_id: 'A000374')

          presenter = PoliticianPresenter.new(politician)

          expect(presenter.votes_with_party).to eq(97.0)
        end
      end
    end
  end
end
