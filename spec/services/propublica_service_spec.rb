require 'rails_helper'

describe PropublicaService do
  context '#get_members' do
    it 'should return a list of members from a specified chamber' do
      VCR.use_cassette('propublica-house-service') do
        url_params = { congress: '115', chamber: 'house' }
        service = PropublicaService.new(url_params)

        expect(service.get_members.first.keys).to include(:title)
        expect(service.get_members.first.keys).to include(:first_name)
        expect(service.get_members.first.keys).to include(:last_name)
        expect(service.get_members.first.keys).to include(:party)
        expect(service.get_members.first.keys).to include(:state)
        expect(service.get_members.first.keys).to include(:twitter_account)
        expect(service.get_members.first.keys).to include(:propublica_id)

        expect(service.get_members.first.keys).to_not include(:gender)
        expect(service.get_members.first.keys).to_not include(:facebook_account)
      end
    end

    it 'should return a list of members from the other chamber' do
      VCR.use_cassette('propublica-congress-service') do
        url_params = { congress: '115', chamber: 'house' }
        service = PropublicaService.new(url_params)

        expect(service.get_members.first.keys).to include(:title)
        expect(service.get_members.first.keys).to include(:first_name)
        expect(service.get_members.first.keys).to include(:last_name)
        expect(service.get_members.first.keys).to include(:party)
        expect(service.get_members.first.keys).to include(:state)
        expect(service.get_members.first.keys).to include(:twitter_account)
        expect(service.get_members.first.keys).to include(:propublica_id)

        expect(service.get_members.first.keys).to_not include(:gender)
        expect(service.get_members.first.keys).to_not include(:facebook_account)
      end
    end

    it 'should return members from a different congress' do
      VCR.use_cassette('propublica-previous-service') do
        url_params = { congress: '115', chamber: 'house' }
        service = PropublicaService.new(url_params)

        expect(service.get_members.first.keys).to include(:title)
        expect(service.get_members.first.keys).to include(:first_name)
        expect(service.get_members.first.keys).to include(:last_name)
        expect(service.get_members.first.keys).to include(:party)
        expect(service.get_members.first.keys).to include(:state)
        expect(service.get_members.first.keys).to include(:twitter_account)
        expect(service.get_members.first.keys).to include(:propublica_id)

        expect(service.get_members.first.keys).to_not include(:gender)
        expect(service.get_members.first.keys).to_not include(:facebook_account)
      end
    end
  end

  context '#get_member' do
    it 'should return a single member' do
      VCR.use_cassette('propublica-single-member-service') do
        url_params = { member_id: 'A000374' }
        service = PropublicaService.new(url_params)

        expect(service.get_member.keys).to include(:first_name)
        expect(service.get_member.keys).to include(:last_name)
        expect(service.get_member.keys).to include(:twitter_account)
        expect(service.get_member.keys).to include(:roles)

        expect(service.get_member[:roles].first.keys).to include(:party)
        expect(service.get_member[:roles].first.keys).to include(:title)
        expect(service.get_member[:roles].first.keys).to include(:state)
        expect(service.get_member[:roles].first.keys).to include(:votes_with_party_pct)
      end
    end
  end
end
