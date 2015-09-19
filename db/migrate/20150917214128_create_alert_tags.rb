class CreateAlertTags < ActiveRecord::Migration
  def change
    create_table :alert_tags do |t|
      t.references :tags
      t.references :alert

      t.timestamps null: false
    end
  end
end
