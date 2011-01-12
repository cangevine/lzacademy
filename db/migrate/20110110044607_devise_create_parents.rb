class DeviseCreateParents < ActiveRecord::Migration
  def self.up
    create_table :parents do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable
    end

    add_index :parents, :email,                :unique => true
    add_index :parents, :reset_password_token, :unique => true
    # add_index :parents, :confirmation_token,   :unique => true
    # add_index :parents, :unlock_token,         :unique => true
  end

  def self.down
    # not sure how to undo devise migrations!
  end
end
