class Politician < ApplicationRecord
  validates_presence_of :first_name, :last_name, :title, :gender, :party,
                        :twitter_account, :facebook_account, :next_election,
                        :state, :district, :votes_with_party_pct

  has_one :profile, as: :owner
end
