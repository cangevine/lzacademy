class CreateSessions < ActiveRecord::Migration
  def self.up
    create_table :sessions do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :name
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :sessions
  end
end
