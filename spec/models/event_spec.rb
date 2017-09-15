require 'rails_helper'

RSpec.describe Event, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:start_date) }
  it { should validate_presence_of(:recurrances) }
  it { should validate_presence_of(:delivery_day) }
end
