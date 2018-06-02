class Politician < ApplicationRecord
  validates_presence_of :first_name, :last_name, :title, :party,
                        :twitter_account, :state, :propublica_id

  has_one :profile, as: :owner
end
