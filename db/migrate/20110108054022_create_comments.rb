class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.text :body, :admin_feedback
      t.boolean :published
      t.references :registration, :teacher
      t.timestamp :published_at, :admin_feedback_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
