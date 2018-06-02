require 'rails_helper'

describe PropublicaService do
  context '#get_members' do
    it 'should return a list of members from a specified chamber' do
      service = PropublicaService.new('115', 'house')

      expect(service.get_members.first.keys).to include(:title)
      expect(service.get_members.first.keys).to include(:first_name)
      expect(service.get_members.first.keys).to include(:last_name)
      expect(service.get_members.first.keys).to include(:party)
      expect(service.get_members.first.keys).to include(:state)
      expect(service.get_members.first.keys).to include(:twitter_account)
      expect(service.get_members.first.keys).to include(:govtrack_id)

      expect(service.get_members.first.keys).to_not include(:gender)
      expect(service.get_members.first.keys).to_not include(:facebook_account)
    end

    it 'should return a list of members from the other chamber' do
      service = PropublicaService.new('115', 'senate')

      expect(service.get_members.first.keys).to include(:title)
      expect(service.get_members.first.keys).to include(:first_name)
      expect(service.get_members.first.keys).to include(:last_name)
      expect(service.get_members.first.keys).to include(:party)
      expect(service.get_members.first.keys).to include(:state)
      expect(service.get_members.first.keys).to include(:twitter_account)
      expect(service.get_members.first.keys).to include(:govtrack_id)

      expect(service.get_members.first.keys).to_not include(:gender)
      expect(service.get_members.first.keys).to_not include(:facebook_account)
    end

    it 'should return members from a different congress' do
      service = PropublicaService.new('113', 'house')

      expect(service.get_members.first.keys).to include(:title)
      expect(service.get_members.first.keys).to include(:first_name)
      expect(service.get_members.first.keys).to include(:last_name)
      expect(service.get_members.first.keys).to include(:party)
      expect(service.get_members.first.keys).to include(:state)
      expect(service.get_members.first.keys).to include(:twitter_account)
      expect(service.get_members.first.keys).to include(:govtrack_id)

      expect(service.get_members.first.keys).to_not include(:gender)
      expect(service.get_members.first.keys).to_not include(:facebook_account)
    end
  end
end