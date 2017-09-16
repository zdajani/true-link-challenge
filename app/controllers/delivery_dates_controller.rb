class DeliveryDatesController < ApplicationController
  before_action :set_event

  def all
    delivery_dates_calculator = DeliveryDates.new
    dates_num = params[:dates_num] ? params[:dates_num].to_i : 4
    dates = delivery_dates_calculator.get(
      @event.recurrances,
      @event.start_date,
      @event.delivery_day,
      dates_num
    )

    render json: dates, status: :ok
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end
end
