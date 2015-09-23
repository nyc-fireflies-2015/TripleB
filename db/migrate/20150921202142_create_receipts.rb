class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
    	t.references :alert, null: false
    	t.references :mechanic, null: false
    	t.references :location
    	t.integer :distance, null: false
    	t.integer :duration, null: false

    	t.timestamps null: false
    end
  end
end
