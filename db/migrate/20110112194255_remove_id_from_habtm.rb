class RemoveIdFromHabtm < ActiveRecord::Migration
  def self.up
    change_table :roles_users do |t|
      remove_column :roles_users, :id
    end
  end

  def self.down
    change_table :roles_users do |t|
      t.id
    end
  end
end
