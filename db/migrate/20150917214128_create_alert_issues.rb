class CreateAlertIssues < ActiveRecord::Migration
  def change
    create_table :alert_issues do |t|
      t.references :issue
      t.references :alert
      t.string :description
      t.timestamps
    end
  end
end
