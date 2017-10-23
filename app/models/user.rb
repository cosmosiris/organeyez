require 'bcrypt'

class User < ApplicationRecord

  include BCrypt

  has_many :memberships, foreign_key: :member_id
  has_many :organizations, through: :memberships
  has_many :reviews, foreign_key: :writer_id
  has_many :project_members, foreign_key: :member_id
  has_many :projects, through: :project_members
  has_many :tasks, foreign_key: :leader_id

  validates :first_name, :last_name, :email, presence: true
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
