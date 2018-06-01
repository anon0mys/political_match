class TwitterGetterJob < ApplicationJob
  queue_as :default

  def perform
    politicians = Politician.all
    twitter = TwitterService.new
    politicians.each do |politician|
      tweets = twitter.get_tweets(politician.twitter_account)
      builder = ProfileBuilder.new(tweets)
      if politician.profile.nil?
        politician.create_profile(builder.results)
      else
        politician.profile.update(builder.results)
      end
    end
  end
end
