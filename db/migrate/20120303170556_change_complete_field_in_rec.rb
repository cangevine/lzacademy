class ChangeCompleteFieldInRec < ActiveRecord::Migration
  def self.up
    change_table :recommendations do |t|
      t.timestamp :completed_at
    end
    remove_column :recommendations, :completed
  end

  def self.down
    change_table :recommendations do |t|
      t.boolean :completed
    end
    remove_column :recommendations, :completed_at
  end
end
