class AddBioToTeacher < ActiveRecord::Migration
  def self.up
    add_column :teachers, :bio, :text
  end

  def self.down
    remove_column :teachers, :bio
  end
end
