class User < ApplicationRecord
  has_many :events, class_name: 'Event', foreign_key: 'creator_id'
  has_many :event_users
  has_many :created_events, through: :event_users, source: :event

  validates :name, presence: true, uniqueness: true, length: {minimum: 3, maximum: 20}
  
  has_secure_password
end