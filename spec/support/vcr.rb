VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/cassettes"
  config.hook_into :webmock
  config.allow_http_connections_when_no_cassette = false
  config.filter_sensitive_data('<PROPUBLICA_API_KEY>') { ENV['PROPUBLICA_API_KEY'] }
end
