class Politician < ApplicationRecord
  validates_presence_of :first_name, :last_name, :title, :party,
                        :twitter_account, :state, :propublica_id

  has_one :profile, as: :owner

  def self.filter_by_chamber(chamber)
    if chamber == 'senate'
      where('title ILIKE ?', '%Senator%')
    elsif chamber == 'house'
      where.not('title ILIKE ?', '%Senator%')
    else
      self.all
    end
  end
end
