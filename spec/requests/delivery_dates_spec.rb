RSpec.describe 'DeliveryDates', type: :request do
  describe 'GET /delivery_dates' do
    it 'returns four delivery dates for an event' do
      event = create(:event)
      get delivery_dates_path(id: event.id)
      expect(response).to have_http_status(:ok)

      delivery_dates = [
        event.start_date,
        Date.new(2017, 10, 13),
        event.start_date.next_month(2),
        event.start_date.next_month(3)
      ].to_json

      expect(response.body).to eq(delivery_dates)
    end
  end
end
