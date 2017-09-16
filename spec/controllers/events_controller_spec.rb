require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  let(:valid_attributes) {
    build(:event).attributes
  }

  let(:invalid_attributes) {
    build(:event, start_date: '').attributes
  }

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Event' do
        expect {
          post :create, params: { event: valid_attributes }
        }.to change(Event, :count).by(1)
      end
    end

    context 'with invalid params' do
      it 'does not create a new Event' do
        expect {
          post :create, params: { event: invalid_attributes }
        }.to_not change(Event, :count)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        build(:event, recurrances: 3).attributes
      }

      it 'updates the requested event' do
        event = Event.create! valid_attributes
        put :update, params: { id: event.to_param, event: new_attributes }
        event.reload
        expect(event.recurrances).to eq(3)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested event' do
      event = Event.create! valid_attributes
      expect {
        delete :destroy, params: { id: event.to_param }
      }.to change(Event, :count).by(-1)
    end
  end

end
