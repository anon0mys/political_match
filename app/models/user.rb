class User < ApplicationRecord
  validates_presence_of :name, :email, :password_digest
  validates :password_digest, confirmation: { case_sensitive: true }
  has_secure_password
  has_one :profile, as: :owner
end
