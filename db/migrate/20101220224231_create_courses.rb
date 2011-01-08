class CreateCourses < ActiveRecord::Migration
  def self.up
    create_table :courses do |t|
      t.references :program, :teacher, :location
      t.string :days_of_week
      t.string :start_time
      t.string :end_time

      t.timestamps
    end
  end

  def self.down
    drop_table :courses
  end
end
