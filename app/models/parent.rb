# == Schema Information
# Schema version: 20101220225117
#
# Table name: parents
#
#  id         :integer(4)      not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  address    :string(255)
#  city       :string(255)
#  zip        :string(255)
#  email      :string(255)
#  home_phone :string(255)
#  cell_phone :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Parent < ActiveRecord::Base
  has_many :students
  has_many :registrations, :through => :students
  
  accepts_nested_attributes_for :students, :reject_if => :all_blank
  
  validates_presence_of :first_name, :last_name, :address, :city, :zip, :email, :home_phone
  
  def display_name
    "#{self.first_name} #{self.last_name}"
  end
end
