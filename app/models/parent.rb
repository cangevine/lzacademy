# == Schema Information
# Schema version: 20110112170531
#
# Table name: parents
#
#  id                   :integer(4)      not null, primary key
#  email                :string(255)     default(""), not null
#  encrypted_password   :string(128)     default(""), not null
#  password_salt        :string(255)     default(""), not null
#  reset_password_token :string(255)
#  remember_token       :string(255)
#  remember_created_at  :datetime
#  sign_in_count        :integer(4)      default(0)
#  current_sign_in_at   :datetime
#  last_sign_in_at      :datetime
#  current_sign_in_ip   :string(255)
#  last_sign_in_ip      :string(255)
#  address              :string(255)
#  city                 :string(255)
#  zip                  :string(255)
#  home_phone           :string(255)
#  cell_phone           :string(255)
#  first_name           :string(255)
#  last_name            :string(255)
#

class Parent < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :address, :city, :zip, :home_phone, :cell_phone, 
                    :email, :password, :password_confirmation, :remember_me,
                    :students_attributes
  
  
  has_many :students
  has_many :registrations, :through => :students
  
  accepts_nested_attributes_for :students, :reject_if => :all_blank
  
  validates_presence_of :first_name, :last_name, :address, :city, :zip, :email, :home_phone
  validates_uniqueness_of :email
  
  def display_name
    "#{self.first_name} #{self.last_name}"
  end
end
