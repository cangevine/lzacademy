class AddParentAddressFields < ActiveRecord::Migration
  def self.up
    change_table :parents do |t|
      t.string :address, :city, :zip, :home_phone, :cell_phone
    end
  end

  def self.down
  end
end
