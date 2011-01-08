class AddCostToCourse < ActiveRecord::Migration
  def self.up
    change_table :courses do |t|
      t.decimal :cost
    end
  end

  def self.down
    change_table :courses do |t|
      remove_column :cost
    end
  end
end
