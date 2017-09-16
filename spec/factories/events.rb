FactoryGirl.define do
  factory :event do
    name 'MyString'
    start_date Date.today
    recurrances 1
    delivery_day Date.today.day
  end
end
