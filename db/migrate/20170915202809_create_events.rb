class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.date :start_date
      t.integer :recurrances
      t.integer :delivery_day
    end
  end
end
