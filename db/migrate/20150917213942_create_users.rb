class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :username, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.string :password_digest, null: false
      t.string :bio, default: ''
      t.string :avatar_url, default: '../../app/assets/images/blank_avatar.png'
      t.references :location

      t.timestamps null: false
    end
  end
end