class RemoveParentIdFromRegistrations < ActiveRecord::Migration
  def self.up
    change_table :registrations do |t|
      remove_column :registrations, :parent_id
    end
  end

  def self.down
    change_table :registrations do |t|
      t.references :parent
    end
  end
end
