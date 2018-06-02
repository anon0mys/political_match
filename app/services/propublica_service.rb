class PropublicaService
  def initialize(congress, chamber)
    @conn = Faraday.new(url: 'https://api.propublica.org/')
    @url = "congress/v1/#{congress}/#{chamber}/members.json"
  end

  def get_members
    response = JSON.parse(make_request.body, symbolize_names: true)
    parse_members(response[:results].first[:members])
  end

  private

  def make_request
    @conn.get do |req|
      req.url @url
      req.headers['X-API-Key'] = ENV['PROPUBLICA_API_KEY']
    end
  end

  def parse_members(members)
    keep = %i[first_name last_name title state party twitter_account govtrack_id]
    members.reduce([]) do |results, member|
      results << member.delete_if{|key, value| !keep.include?(key)}
      results
    end
  end
end
