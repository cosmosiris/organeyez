require 'bcrypt'

class Organization < ApplicationRecord
  include BCrypt

  has_many  :projects
  has_many  :organization_members
  has_many  :members, through: :organization_members
  validates :name, :email, :password_hash, presence: true
  validates :email, uniqueness: true
  validate  :presence_of_password

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @plain_text_password = new_password
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(password_to_check)
    if self.password == password_to_check
      true
    end
  end

  private
  def presence_of_password
    if @plain_text_password == ""
      errors.add(:password, "can't be empty")
    end
  end

end
