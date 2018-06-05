class Profile < ApplicationRecord
  validates_presence_of :overall, :political_type, :preferred_party,
                        :authority_rating, :social_rating
  belongs_to :owner, polymorphic: true
  before_validation :build_profile

  private

  def build_profile
    survey = JSON.parse(overall, symbolize_names: true)
    self.overall ||= overall
    self.authority_rating ||= set_authority(survey)
    self.social_rating ||= set_social(survey)
    self.political_type ||= set_type
  end

  def set_authority(survey)
    ratio = ( survey[:Conservative].to_f + survey[:Liberal].to_f ) / ( survey[:Green].to_f + survey[:Libertarian].to_f )
    if ratio <= 1
      (ratio * 5).round(2)
    elsif ratio < 2
      ((ratio - 1) * 5).round(2) + 5
    else
      10
    end
  end

  def set_social(survey)
    ratio = ( survey[:Green].to_f + survey[:Liberal].to_f ) / ( survey[:Conservative].to_f + survey[:Libertarian].to_f )
    if ratio <= 1
      (ratio * 5).round(2)
    elsif ratio < 2
      ((ratio - 1) * 5).round(2) + 5
    else
      10
    end
  end

  def set_type
    'enum to do'
  end
end
