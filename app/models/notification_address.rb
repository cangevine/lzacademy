# == Schema Information
# Schema version: 20110126224355
#
# Table name: notification_addresses
#
#  id              :integer(4)      not null, primary key
#  email           :string(255)
#  first_name      :string(255)
#  last_name       :string(255)
#  registration_id :integer(4)
#  created_at      :datetime
#  updated_at      :datetime
#

class NotificationAddress < ActiveRecord::Base
  belongs_to :registration
  
  validates_presence_of :email
  
  def display_name
    "#{self.first_name} #{self.last_name}"
  end
end
