class RemoveTeacherFromComment < ActiveRecord::Migration
  def self.up
    change_table :comments do |t|
      remove_column :comments, :teacher_id
    end
  end

  def self.down
    change_table :comments do |t|
      t.references :teacher
    end
  end
end
