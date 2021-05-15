class AddSaltToUsers < ActiveRecord::Migration[6.1]
  def up
    add_column :users, :salt, :string
    rename_column :users, :password, :encrypted_password
  end
  
  def down
    drop_column :users, :salt
    rename_column :users, :encrypted_password, :password
  end
end
