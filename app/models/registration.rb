# == Schema Information
# Schema version: 20110108054022
#
# Table name: registrations
#
#  id         :integer(4)      not null, primary key
#  student_id :integer(4)
#  course_id  :integer(4)
#  experience :text
#  balance    :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

class Registration < ActiveRecord::Base
  belongs_to :student
  belongs_to :course
  
  has_many :comments
  has_many :notification_addresses
  
  def remaining_balance
    if self.balance.nil?
      "Pending"
    else
      "$#{self.balance}"
    end
  end
  
  def last_comment_date
    unless self.comments.empty?
      c = self.comments.last
      c.updated_at
    end
  end
  
  def all_notification_addresses
    [self.student.parent.email]
  end
  
end
