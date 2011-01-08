# == Schema Information
# Schema version: 20101220225117
#
# Table name: registrations
#
#  id         :integer(4)      not null, primary key
#  student_id :integer(4)
#  parent_id  :integer(4)
#  course_id  :integer(4)
#  experience :text
#  balance    :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

class Registration < ActiveRecord::Base
  belongs_to :student
  belongs_to :teacher
  belongs_to :course
end
