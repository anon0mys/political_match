class Profile < ApplicationRecord
  validates_presence_of :overall, :preferred_party, :political_type,
                        :authority_rating, :social_rating
  belongs_to :owner, polymorphic: true

  enum political_type: ['Collective Anarchy', 'Nuetral Anarchy', 'Lawless Isolationism',
                        'Social Democracy', 'Representative Democracy', 'Libertarian Republic',
                        'Totalitarian Democracy', 'Oligarchy', 'Totalitarian Dictatorship']
end
