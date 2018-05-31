require 'rails_helper'

RSpec.describe Politician, type: :model do
  context 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :role }
    it { should validate_presence_of :gender }
    it { should validate_presence_of :party }
    it { should validate_presence_of :twitter_id }
    it { should validate_presence_of :facebook_account }
    it { should validate_presence_of :next_election }
  end
end
