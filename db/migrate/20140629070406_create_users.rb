class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :email
      t.string :password
      t.string :password_salt
      t.boolean :has_device_access
      t.string :unique_token
      t.boolean :admin

      t.timestamps
    end
  end
end
