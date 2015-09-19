class CreateAlertTags < ActiveRecord::Migration
  def change
    create_table :alert_tags do |t|
      t.references :tag
      t.references :alert

      t.timestamps null: false
    end
  end
end
