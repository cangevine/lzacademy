# == Schema Information
# Schema version: 20110118044722
#
# Table name: emergency_forms
#
#  id                       :integer(4)      not null, primary key
#  addl_phone_number        :string(255)
#  ec_name                  :string(255)
#  ec_phone_number          :string(255)
#  ec_relationship          :string(255)
#  health_insurance_company :string(255)
#  health_insurance_numbers :string(255)
#  physician_name           :string(255)
#  physician_phone_number   :string(255)
#  allergies                :text
#  advertisement_permission :boolean(1)
#  conduct_expectations     :string(255)
#  food_restrictions        :text
#  learning_differences     :text
#  student_id               :integer(4)
#  created_at               :datetime
#  updated_at               :datetime
#

class EmergencyForm < ActiveRecord::Base
  
  belongs_to :student
  
  validates_presence_of :ec_name, :ec_phone_number, :ec_relationship, :health_insurance_company, :health_insurance_numbers,
        :physician_name, :physician_phone_number, :advertisement_permission, :conduct_expectations
  
end
