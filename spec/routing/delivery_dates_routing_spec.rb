require 'rails_helper'

RSpec.describe DeliveryDatesController, type: :routing do
  describe 'routing' do
    it 'routes to #get' do
      expect(get: 'api/delivery_dates').to route_to('delivery_dates#all')
    end
  end
end
