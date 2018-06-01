require 'rails_helper'

RSpec.describe Politician, type: :model do
  context 'validations' do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :title }
    it { should validate_presence_of :gender }
    it { should validate_presence_of :party }
    it { should validate_presence_of :twitter_account }
    it { should validate_presence_of :facebook_account }
    it { should validate_presence_of :next_election }
    it { should validate_presence_of :state }
    it { should validate_presence_of :district }
    it { should validate_presence_of :votes_with_party_pct }
  end

  context 'relationships' do
    it { should have_one :profile }
  end
end
