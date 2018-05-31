require 'rails_helper'

describe TwitterService do
  context 'instance methods' do
    context '#get_tweets' do
      let(:user) { "RepDianaDeGette" }
      subject { TwitterService.new }

      it 'should return an array of strings' do
        expect(subject.get_tweets(user)).to be_an Array
        expect(subject.get_tweets(user).first).to be_a String
      end
    end
  end
end
