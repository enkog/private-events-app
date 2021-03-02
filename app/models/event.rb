class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :event_users
  has_many :attendees, through: :event_users, source: :user

  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  validates :location, presence: true
  validates :date, presence: true

  scope :upcoming, -> { where('date >= ?', Date.today) }
  scope :past, -> { where('date < ?', Date.today) }
end
