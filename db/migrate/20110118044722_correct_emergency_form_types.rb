class CorrectEmergencyFormTypes < ActiveRecord::Migration
  def self.up
    change_table :emergency_forms do |f|
      change_column :emergency_forms, :learning_differences, :text
      change_column :emergency_forms, :allergies, :text
      change_column :emergency_forms, :food_restrictions, :text
    end
  end

  def self.down
    change_table :emergency_forms do |f|
      change_column :emergency_forms, :learning_differences, :string
      change_column :emergency_forms, :allergies, :string
      change_column :emergency_forms, :food_restrictions, :string
    end
  end
end
