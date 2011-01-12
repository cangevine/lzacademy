class RenameSessionToTerm < ActiveRecord::Migration
  def self.up
    rename_table :sessions, :terms
    rename_column :courses, :session_id, :term_id
  end

  def self.down
    rename_table :terms, :sessions
    rename_column :courses, :term_id, :session_id
  end
end
