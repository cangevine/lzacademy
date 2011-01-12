class AddNameToParent < ActiveRecord::Migration
  def self.up
    change_table :parents do |t|
      t.string :first_name, :last_name
    end
  end

  def self.down
    change_table :parents do |t|
      remove_column :parents, :first_name
      remove_column :parents, :last_name
    end
  end
end
