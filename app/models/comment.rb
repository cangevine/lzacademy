# == Schema Information
# Schema version: 20110108054022
#
# Table name: comments
#
#  id                        :integer(4)      not null, primary key
#  body                      :text
#  admin_feedback            :text
#  published                 :boolean(1)
#  registration_id           :integer(4)
#  teacher_id                :integer(4)
#  published_at              :datetime
#  admin_feedback_updated_at :datetime
#  created_at                :datetime
#  updated_at                :datetime
#

class Comment < ActiveRecord::Base
  belongs_to :registration
  
  scope :published, lambda {
    where("published = ?", 1)
  }
  
end
