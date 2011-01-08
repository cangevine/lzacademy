class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.datetime :birthday
      t.string :shirt_size

      t.timestamps
    end
  end

  def self.down
    drop_table :students
  end
end
