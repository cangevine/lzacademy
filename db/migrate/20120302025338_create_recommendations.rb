class CreateRecommendations < ActiveRecord::Migration
  def self.up
    create_table :recommendations do |t|
      t.boolean :requested
      t.boolean :completed
      t.string :teacher_name
      t.string :teacher_email
      t.string :teacher_school
      t.string :teacher_position
      t.text :notes
      t.references :student
      t.timestamps
    end
  end

  def self.down
    drop_table :recommendations
  end
end
