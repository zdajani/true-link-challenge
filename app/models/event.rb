class Event < ApplicationRecord
  validates :name, :start_date, :recurrances, :delivery_day, presence: true
end
