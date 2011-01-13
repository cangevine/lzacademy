# == Schema Information
# Schema version: 20101220225117
#
# Table name: students
#
#  id         :integer(4)      not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  nickname   :string(255)
#  birthday   :datetime
#  shirt_size :string(255)
#  created_at :datetime
#  updated_at :datetime
#  parent_id  :integer(4)
#

class Student < ActiveRecord::Base
  belongs_to :parent
  has_many :registrations
  
  attr_accessible :first_name, :last_name, :nickname, :birthday, :shirt_size, :parent_id
  
  validates_presence_of :first_name, :last_name, :birthday
  
  def display_name
    name = "#{self.first_name} #{self.last_name}"
    name << " (#{self.nickname})" unless self.nickname.empty?
    name
  end
  
  def age
    ((Time.now - self.birthday) / 1.year).floor
  end
end
