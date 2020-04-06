class CreateTripsTable < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :destination
      t.datetime :date
      t.string :budjet
      t.integer :user_id
    end
  end
end
