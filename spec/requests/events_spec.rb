require 'rails_helper'

RSpec.describe 'Events', type: :request do
  describe 'GET /events' do
    it 'returns all events' do
      create_list(:event, 5)
      get events_path

      expect(response).to have_http_status(:success)
      expect(json.size).to eq(5)
    end
  end

  describe 'GET /event' do
    it 'returns a specific event' do
      event = create(:event)
      get event_path(event.id)

      expect(response).to have_http_status(:success)
      expect(response.body).to eq(event.to_json)
    end
  end

  describe 'POST /event' do
    it 'creates a new event' do
      post events_path, params: { event: attributes_for(:event) }

      expect(response).to have_http_status(:created)
    end
  end
end
