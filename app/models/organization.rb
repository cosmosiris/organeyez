require 'bcrypt'

class Organization < ApplicationRecord
  include BCrypt

  has_many  :projects
  has_many  :organization_members
  has_many  :members, through: :organization_members
  validates :name, :email, :password_hash, presence: true
  validates :email, uniqueness: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
