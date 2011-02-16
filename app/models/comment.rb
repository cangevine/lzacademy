# == Schema Information
# Schema version: 20110126224355
#
# Table name: comments
#
#  id                        :integer(4)      not null, primary key
#  body                      :text
#  admin_feedback            :text
#  published                 :boolean(1)
#  registration_id           :integer(4)
#  published_at              :datetime
#  admin_feedback_updated_at :datetime
#  created_at                :datetime
#  updated_at                :datetime
#

class Comment < ActiveRecord::Base
  belongs_to :registration
  
  validates_presence_of :body, :registration_id
  
  after_create :new_comment_notice
  before_update :update_comment_notices
  
  scope :published, lambda {
    where("published = ?", true)
  }
  
  scope :pending, lambda {
    where("published = ?", false)
  }
  
  
  private
    def new_comment_notice
      CommentMailer.created_notice(self, "magistraroberts@hotmail.com").deliver
      CommentMailer.created_notice(self, "info@lzacademy.com").deliver
    end
  
    def update_comment_notices
      if self.published_changed? && self.published
        self.published_at = Time.now
        CommentMailer.published_notice(self, "info@lzacademy.com").deliver
        CommentMailer.published_notice(self, self.registration.student.parent.email).deliver
        nas = self.registration.notification_addresses
        nas.each do |na|
          CommentMailer.published_notice(self, na.email).deliver
        end
      elsif self.body_changed?
        CommentMailer.updated_body_notice(self, "magistraroberts@hotmail.com").deliver
        CommentMailer.updated_body_notice(self, "info@lzacademy.com").deliver
      elsif self.admin_feedback_changed? && !self.published
        self.admin_feedback_updated_at = Time.now
        CommentMailer.updated_feedback_notice(self, "colinangevine@gmail.com").deliver
        CommentMailer.updated_feedback_notice(self, self.registration.course.teacher.email).deliver
      end
    end
  
end
