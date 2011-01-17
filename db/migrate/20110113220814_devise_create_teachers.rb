class DeviseCreateTeachers < ActiveRecord::Migration
  def self.up
    change_table(:teachers) do |t|
      #t.database_authenticatable :null => false
      t.string :password, :encrypted_password, :password_salt
      t.recoverable
      t.rememberable
      t.trackable

      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable
    end

    add_index :teachers, :email,                :unique => true
    add_index :teachers, :reset_password_token, :unique => true
    # add_index :teachers, :confirmation_token,   :unique => true
    # add_index :teachers, :unlock_token,         :unique => true
  end

  def self.down
    change_table :teachers do |t|
      remove_column :teachers, :password
      remove_column :teachers, :encrypted_password
      remove_column :teachers, :password_salt
      
      remove_column :teachers, :remember_token
      remove_column :teachers, :remember_created_at

      remove_column :teachers, :sign_in_count
      remove_column :teachers, :current_sign_in_at
      remove_column :teachers, :last_sign_in_at
      remove_column :teachers, :current_sign_in_ip
      remove_column :teachers, :last_sign_in_ip
    end
  end
end
