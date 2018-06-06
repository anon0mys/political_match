require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe 'valiations' do
    it { should validate_presence_of :preferred_party }
    it { should validate_presence_of :political_type }
    it { should validate_presence_of :authority_rating }
    it { should validate_presence_of :social_rating }
    it { should validate_presence_of :overall }
  end
  
  describe 'relationships' do
    it { should belong_to :owner }
  end
end
