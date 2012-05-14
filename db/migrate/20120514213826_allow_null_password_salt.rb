class AllowNullPasswordSalt < ActiveRecord::Migration
  def self.up
    change_column :parents, :password_salt, :string, :null => true
    change_column :parents, :reset_password_token, :string, :null => true
  end

  def self.down
    change_column :parents, :password_salt, :string, :null => false
    change_column :parents, :password_salt, :string, :null => false
  end
end
