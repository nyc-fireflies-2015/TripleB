class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.references :creator
      t.references :mechanic
      t.integer :latitude, null: false
      t.integer :longitude, null: false
      t.string :status, default: 'incomplete'

      t.timestamps null: false
    end
  end
end
