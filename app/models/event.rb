class Event < ApplicationRecord
  belongs_to :user
  has_many :event_users
  has_many :attendees, through: :event_users, source: :user

  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  validates :user_id, presence: true
end