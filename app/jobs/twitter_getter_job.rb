class TwitterGetterJob < ApplicationJob
  queue_as :default

  def perform
    politicians = Politician.where.not(twitter_account: nil)
    twitter = TwitterService.new
    politicians.each do |politician|
      tweets = twitter.get_tweets(politician.twitter_account)
      builder = ProfileBuilder.new(tweets)
      if politician.profile.nil?
        politician.create_profile(builder.results)
        puts "#{politician.title} #{politician.last_name} created"
      else
        politician.profile.update(builder.results)
        puts "#{politician.title} #{politician.last_name} updated"
      end
    end
  end
end
