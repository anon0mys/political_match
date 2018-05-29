require 'rails_helper'

describe User do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_presence_of :password_digest }
    it { should validate_confirmation_of :password_digest }
  end

  describe 'relationships' do
    it { should have_one :profile }
  end
end
