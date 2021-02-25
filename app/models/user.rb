class User < ApplicationRecord
  has_many :created_events, class_name: 'Event', foreign_key: :creator_id
  has_many :event_users, foreign_key: :user_id
  has_many :attended_events, through: :event_users

  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 20 }

  has_secure_password
end
