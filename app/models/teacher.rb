# == Schema Information
# Schema version: 20101220225117
#
# Table name: teachers
#
#  id         :integer(4)      not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  nickname   :string(255)
#  cell_phone :string(255)
#  email      :string(255)
#  bio        :text
#  shirt_size :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Teacher < ActiveRecord::Base
  
  has_many :courses
  has_many :registrations, :through => :courses
  has_and_belongs_to_many :roles, :join_table => :roles_users
  
  def display_name
    self.first_name+" "+self.last_name
  end
end
