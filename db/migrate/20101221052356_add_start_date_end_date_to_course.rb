class AddStartDateEndDateToCourse < ActiveRecord::Migration
  def self.up
    change_table :courses do |t|
      t.datetime :start_date
      t.datetime :end_date
    end
  end

  def self.down
    change_table :courses do |t|
      remove_column :start_date
      remove_column :end_date
    end
  end
end
