class TwitterGetterJob < ApplicationJob
  queue_as :default

  def perform
    politicians = Politician.where.not(twitter_account: nil)
    twitter = TwitterService.new
    politicians.each do |politician|
      begin
        survey = twitter.get_tweets(politician.twitter_account)
        survey[:party] = politician.party
        builder = ProfileBuilder.new(survey)
        set_profile(politician, builder.results)
      rescue Twitter::Error::Unauthorized, Twitter::Error::NotFound, Twitter::Error::TooManyRequests => e
        puts e.message
        if e.message.include?('Rate limit exceeded')
          sleep e.rate_limit.reset_in + 1
          retry
        else
          next
        end
      end
    end
  end

  private

  def set_profile(politician, results)
    if politician.profile.nil?
      politician.create_profile!(results)
      puts "#{politician.title} #{politician.last_name} created"
    else
      politician.profile.update!(results)
      puts "#{politician.title} #{politician.last_name} updated"
    end
  end
end
