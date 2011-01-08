class AddParentIdToStudent < ActiveRecord::Migration
  def self.up
    change_table :students do |t|
      t.references :parent
    end
  end

  def self.down
    change_table :students do |t|
      remove_column :parent_id
    end
  end
end
