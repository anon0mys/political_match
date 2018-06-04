require 'rails_helper'

RSpec.describe Politician, type: :model do
  context 'validations' do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :title }
    it { should validate_presence_of :party }
    it { should validate_presence_of :twitter_account }
    it { should validate_presence_of :state }
    it { should validate_presence_of :propublica_id }
  end

  context 'relationships' do
    it { should have_one :profile }
  end

  context 'class methods' do
    context '#filter_by_chamber' do
      it 'only return politicians in the selected chamber' do
        create_list(:politician, 20, title: 'Representative')
        create_list(:politician, 10, title: 'Senator, 1st Class')

        expect(Politician.filter_by_chamber('house').count).to eq(20)
        expect(Politician.filter_by_chamber('senate').count).to eq(10)
      end
    end
  end
end
