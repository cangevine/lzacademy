class CreateParents < ActiveRecord::Migration
  def self.up
    create_table :parents do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :city
      t.string :zip
      t.string :email
      t.string :home_phone
      t.string :cell_phone

      t.timestamps
    end
  end

  def self.down
    drop_table :parents
  end
end
