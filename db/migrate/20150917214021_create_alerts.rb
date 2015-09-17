class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.references :creator
      t.references :mechanic
      t.integer :latitude
      t.integer :longitude
      t.string :status
      t.timestamps
    end
  end
end
