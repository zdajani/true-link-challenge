Rails.application.routes.draw do
  scope 'api/' do
    resources :events
    get '/delivery_dates' =>
      'delivery_dates#all', as: 'delivery_dates'
  end
end
