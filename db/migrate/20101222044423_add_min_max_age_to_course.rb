class AddMinMaxAgeToCourse < ActiveRecord::Migration
  def self.up
    change_table :courses do |t|
      t.integer :min_age, :max_age
    end
  end

  def self.down
    change_table :courses do |t|
      remove_column :min_age, :max_age
    end
  end
end
