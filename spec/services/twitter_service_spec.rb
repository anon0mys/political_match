require 'rails_helper'

describe TwitterService do
  context 'instance methods' do
    context '#get_tweets' do
      let(:user) { "RepDianaDeGette" }
      subject { TwitterService.new }

      it 'should return a hash of tweet ids and text' do
        VCR.use_cassette('twitter-service') do
          expect(subject.get_tweets(user)).to be_a Hash
          expect(subject.get_tweets(user).keys.first).to be_a String
          expect(subject.get_tweets(user).values.first).to be_a String
        end
      end

      it 'should return no tweets if there are no tweets' do
        VCR.use_cassette('no-tweets') do
          empty_user = "RepRobBishop"
          expect(subject.get_tweets(empty_user)).to be_a Hash
          expect(subject.get_tweets(empty_user).values.first).to eq('No tweets')
        end
      end
    end
  end
end
