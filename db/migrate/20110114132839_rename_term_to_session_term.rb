class RenameTermToSessionTerm < ActiveRecord::Migration
  def self.up
    change_table :courses do |t|
      rename_column :courses, :term_id, :session_term_id
    end
    rename_table :terms, :session_terms
  end

  def self.down
    change_table :courses do |t|
      rename_column :courses, :session_term_id, :term_id
    end
    rename_table :session_terms, :terms
  end
end
