#ZM: This table feels a little big to me I feel like lat / long can be part of another table used 
# in tandem with an alert... maybe with a type? profile vs alert? 
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
      t.string :bio, default: ''
      t.string :avatar_url, default: 'http://powerlearningny.com/wp-content/uploads/2014/04/blank_male.png'

      t.timestamps null: false
    end
  end
end
