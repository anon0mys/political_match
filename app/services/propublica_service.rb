class PropublicaService
  def initialize(congress, chamber)
    @conn = Faraday.new(url: 'https://api.propublica.org/')
    @url = "congress/v1/#{congress}/#{chamber}/members.json"
  end

  def get_members
    response = JSON.parse(make_request.body, symbolize_names: true)
    response[:results].first[:members]
  end

  private

  def make_request
    @conn.get do |req|
      req.url @url
      req.headers['X-API-Key'] = ENV['PROPUBLICA_API_KEY']
    end
  end
end
