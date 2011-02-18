# == Schema Information
# Schema version: 20110114132839
#
# Table name: courses
#
#  id              :integer(4)      not null, primary key
#  program_id      :integer(4)
#  teacher_id      :integer(4)
#  location_id     :integer(4)
#  days_of_week    :string(255)
#  start_time      :string(255)
#  end_time        :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  cost            :integer(10)
#  min_age         :integer(4)
#  max_age         :integer(4)
#  session_term_id :integer(4)
#

class Course < ActiveRecord::Base
  belongs_to :program
  belongs_to :teacher
  belongs_to :location
  belongs_to :session_term
  
  has_many :registrations
  
  validates_presence_of :program, :teacher, :location, :session_term, :days_of_week, :start_time, :end_time, :min_age, :max_age, :cost
  
  scope :camp, lambda { |year|
    joins(:session_term, :program) & SessionTerm.summer(year)
  }
  
  scope :school, lambda { |year| 
    joins(:session_term, :program) & SessionTerm.school_year(year)
  }
  
  scope :at, lambda { |loc|
    joins(:location).
    where("locations.name = ?", loc)
  }
  
  scope :during, lambda { |sess|
    joins(:session_term).
    where("session_terms.name = ?", sess)
  }
  
  scope :younger, lambda {
    where("max_age <= ?", 10)
  }
  
  scope :older, lambda {
    where("min_age > ?", 10)
  }
  
  def schedule_details
    return "#{self.days_of_week} @ #{self.time_range}"
  end
  
  def time_range
    return "#{self.start_time} - #{self.end_time}"
  end
  
  def is_match?(language, tid)
    return self.program.language == language && self.session_term.id == tid
  end
  
end
