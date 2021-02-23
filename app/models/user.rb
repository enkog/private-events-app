class User < ApplicationRecord
  has_many :events
  has_many :event_users
  has_many :attended_events, through: :event_users

  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 20 }

  has_secure_password
end
