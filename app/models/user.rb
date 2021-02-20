class User < ApplicationRecord
  has_many :events
  validates :name, presence: true, uniqueness: true, length: {minimum: 3, maximum: 20}
end