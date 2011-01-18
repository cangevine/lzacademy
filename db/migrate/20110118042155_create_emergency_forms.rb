class CreateEmergencyForms < ActiveRecord::Migration
  def self.up
    create_table :emergency_forms do |t|
      t.string :addl_phone_number, :ec_name, :ec_phone_number, :ec_relationship, :health_insurance_company, :health_insurance_numbers, 
                :physician_name, :physician_phone_number, :allergies, :advertisement_permission, 
                :conduct_expectations, :food_restrictions, :learning_differences
      t.references :student
      t.timestamps
    end
  end

  def self.down
    drop_table :emergency_forms
  end
end
