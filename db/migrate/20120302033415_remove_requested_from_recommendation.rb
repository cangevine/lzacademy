class RemoveRequestedFromRecommendation < ActiveRecord::Migration
  def self.up
     change_table :recommendations do |t|
       remove_column :recommendations, :requested
     end
  end

  def self.down
    change_table :recommendations do |t|
      t.boolean :requested
    end
  end
end