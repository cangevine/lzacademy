class AddFieldsToRecForm < ActiveRecord::Migration
  def self.up
    change_table :recommendations do |t|
      t.string :courses_taught
      t.string :textbook_used
      t.text :grammar_covered
      t.text :summer_goals
      t.string :placement_exam
      t.text :placement_exam_topics
    end
  end

  def self.down
    remove_column :recommendations, :courses_taught
    remove_column :recommendations, :textbook_used
    remove_column :recommendations, :grammar_covered
    remove_column :recommendations, :summer_goals
    remove_column :recommendations, :placement_exam
    remove_column :recommendations, :placement_exam_topics
  end
end
