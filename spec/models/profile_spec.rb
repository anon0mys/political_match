require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe 'relationships' do
    it { should belong_to :owner }
  end
end
