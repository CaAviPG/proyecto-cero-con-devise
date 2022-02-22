class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle

  validates :location, :date_start, :date_finish, presence: true
end
