class IndicoService
  def initialize(responses)
    @conn = Faraday.new(url: 'https://apiv2.indico.io/political/batch')
    @responses = responses
  end

  def analyze
    response = make_request
    JSON.parse(response.body, symbolize_names: true)
  end

  private
  attr_reader :responses

  def request_body
    results = { data: @responses.values, threshold: 0.25 }
    results.to_json
  end

  def make_request
    @conn.post do |req|
      req.headers['X-Apikey'] = ENV['INDICO_API_KEY']
      req.body = request_body
    end
  end
end
