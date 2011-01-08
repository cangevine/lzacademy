class CreateTeachers < ActiveRecord::Migration
  def self.up
    create_table :teachers do |t|
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.string :cell_phone
      t.string :email
      t.text :bio
      t.string :shirt_size

      t.timestamps
    end
  end

  def self.down
    drop_table :teachers
  end
end
