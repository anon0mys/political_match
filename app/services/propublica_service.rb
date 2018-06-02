class PropublicaService
  def initialize(url_params)
    @conn = Faraday.new(url: 'https://api.propublica.org/')
    @url = build_url(url_params)
  end

  def get_members
    response = JSON.parse(make_request.body, symbolize_names: true)
    parse_members(response[:results].first[:members])
  end

  def get_member
    response = JSON.parse(make_request.body, symbolize_names: true)
    response[:results].first
  end

  private

  def make_request
    @conn.get do |req|
      req.url @url
      req.headers['X-API-Key'] = ENV['PROPUBLICA_API_KEY']
    end
  end

  def parse_members(members)
    keep = %i[first_name last_name title state party twitter_account propublica_id]
    members.reduce([]) do |results, member|
      member[:propublica_id] = member[:id]
      results << member.delete_if{|key, value| !keep.include?(key)}
      results
    end
  end

  def build_url(url_params)
    if url_params.keys.include?(:member_id)
      "congress/v1/members/#{url_params[:member_id]}.json"
    else
      "congress/v1/#{url_params[:congress]}/#{url_params[:chamber]}/members.json"
    end
  end
end
