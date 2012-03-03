class AddLastEmailedAtToRecommendation < ActiveRecord::Migration
  def self.up
      change_table :recommendations do |t|
        t.timestamp :last_emailed_at
      end
  end

  def self.down
    change_table :recommendations do |t|
      remove_column :recommendations, :last_emailed_at
    end
  end
end