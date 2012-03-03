class AddGuidToRecommendations < ActiveRecord::Migration
  def self.up
     change_table :recommendations do |t|
       t.string :guid
     end
  end

  def self.down
    change_table :recommendations do |t|
      remove_column :recommendations, :guid
    end
  end
end
