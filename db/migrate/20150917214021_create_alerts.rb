class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.references :creator, null: false
      t.string :status, default: 'incomplete'
      t.string :description, null: false
      t.references :location

      t.timestamps null: false
    end
  end
end
