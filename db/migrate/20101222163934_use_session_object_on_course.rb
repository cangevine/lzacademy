class UseSessionObjectOnCourse < ActiveRecord::Migration
  def self.up
    change_table :courses do |t|
      remove_column :courses, :start_date
      remove_column :courses, :end_date
      t.references :session
    end
  end

  def self.down
    change_table :courses do |t|
      t.datetime :start_date, :end_date
      remove_column :courses, :session_id
    end
  end
end
