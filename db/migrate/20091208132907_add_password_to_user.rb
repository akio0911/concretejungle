class AddPasswordToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :password_salt, :string
    add_column :users, :password_hash, :string
  end

  def self.down
    remove_column :users, :password_hash
    remove_column :users, :password_salt
  end
end
