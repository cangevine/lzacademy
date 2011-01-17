# == Schema Information
# Schema version: 20110114132839
#
# Table name: session_terms
#
#  id          :integer(4)      not null, primary key
#  start_date  :datetime
#  end_date    :datetime
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class SessionTerm < ActiveRecord::Base
  has_many :courses
  
  scope :summer, lambda { |year|
    where("start_date >= ? AND end_date <= ?", String(year)+"-06-01 00:00:00", String(year)+"-09-01 00:00:00")
  }
  
  scope :school_year, lambda { |year|
    where("start_date >= ? AND end_date <= ?", String(year)+"-09-01 00:00:00", String((year + 1))+"-07-01 00:00:00")
  }
  
  def date_range
    self.start_date.strftime('%D') + ' - ' + self.end_date.strftime('%D')
  end
end
