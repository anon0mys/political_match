class Politician < ApplicationRecord
  validates_presence_of :name, :role, :gender, :party, :twitter_id, :facebook_account, :next_election
  has_one :profile, as: :owner
end
