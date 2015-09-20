class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :username, null: false
      t.float  :latitude
      t.float  :longitude
      t.string :email, null: false
      t.string :phone, null: false
      t.string :password_digest, null: false
      t.string :bio
      t.string :avatar_url

      t.timestamps null: false
    end
  end
end
