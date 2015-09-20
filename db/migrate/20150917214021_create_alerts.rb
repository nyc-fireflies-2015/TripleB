class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.references :mechanic
      t.references :creator, null: false
      t.float :latitude
      t.float :longitude
      t.string :status, default: 'incomplete'
      t.string :description, null: false

      t.timestamps null: false
    end
  end
end
