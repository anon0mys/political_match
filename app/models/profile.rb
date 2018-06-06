class Profile < ApplicationRecord
  validates_presence_of :overall, :preferred_party, :political_type,
                        :authority_rating, :social_rating
  belongs_to :owner, polymorphic: true
end
