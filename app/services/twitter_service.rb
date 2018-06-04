class TwitterService
  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
    end
  end

  def get_tweets(user)
    timeline = @client.user_timeline(user)
    if timeline.empty?
      return {'1': 'No tweets'}
    end
    timeline.reduce({}) do |summary, tweet|
      id = tweet.id.to_s
      summary[id] = tweet.text
      summary
    end
  end
end
