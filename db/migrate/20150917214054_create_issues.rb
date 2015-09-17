class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :part
      t.timestamps
    end
  end
end
