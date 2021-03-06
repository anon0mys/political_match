class PoliticianPresenter
  attr_reader :politician, :service

  def initialize(politician)
    @politician = politician
    @service = PropublicaService.new({ member_id: @politician.propublica_id })
  end

  def title
    @politician.title
  end

  def first_name
    @politician.first_name
  end

  def last_name
    @politician.last_name
  end

  def state
    @politician.state
  end

  def propublica_id
    @politician.propublica_id
  end

  def party
    match_party[@politician.party]
  end

  def profile
    JSON.parse(@politician.profile.overall, symbolize_names: true)
  end

  def votes_with_party
    @service.get_member[:roles].first[:votes_with_party_pct].round(1)
  end

  private

  def match_party
    { 'D' => 'Democrat',
      'R' => 'Republican',
      'I' => 'Independent' }
  end
end
