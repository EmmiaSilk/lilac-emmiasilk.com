class User < ApplicationRecord
  # Things that a user can own
  has_many :posts
  has_many :comments

  validates :username, presence: :true, uniqueness: { case_sensitive: false }

  # All valid roles.
  # Do not change the integer values, or it will break the database.
  # When removing a role, comment it out so the id doesn't get reused.
  enum role: {
    user:    0x00,
    admin:   0x01,
    poster:  0x02,
  }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login

  # Override login method to allow username for login
  def self.find_for_database_authentication warden_conditions
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions).where(["lower(username) = :value OR lower(email) = :value", {value: login.strip.downcase}]).first
  end
end
