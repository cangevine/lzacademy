class ChangeUserRolesToParentsAndTeachers < ActiveRecord::Migration
  def self.up
    change_table :roles_users do |t|
      remove_column :roles_users, :user_id
      t.references :parent, :teacher
    end
  end

  def self.down
    change_table :roles_users do |t|
      remove_column :roles_users, :parent_id
      remove_column :roles_users, :teacher_id
      t.integer :user_id
    end
  end
end
