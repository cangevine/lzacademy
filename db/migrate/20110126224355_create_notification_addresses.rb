class CreateNotificationAddresses < ActiveRecord::Migration
  def self.up
    create_table :notification_addresses do |t|
      t.string :email, :first_name, :last_name
      t.references :registration

      t.timestamps
    end
  end

  def self.down
    drop_table :notification_addresses
  end
end
