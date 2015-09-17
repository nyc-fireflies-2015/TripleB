class CreateAlertIssues < ActiveRecord::Migration
  def change
    create_table :alert_issues do |t|
      t.references :issue
      t.references :alert
      t.string :description, null: false

      t.timestamps null: false
    end
  end
end
