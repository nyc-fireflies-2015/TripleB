class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
    	t.references :alert
    	t.references :mechanic
    	t.references :location
    	t.integer :distance
    	t.integer :duration

    	t.timestamps null: false
    end
  end
end
