# == Schema Information
# Schema version: 20101222163934
#
# Table name: courses
#
#  id           :integer(4)      not null, primary key
#  program_id   :integer(4)
#  teacher_id   :integer(4)
#  location_id  :integer(4)
#  days_of_week :string(255)
#  start_time   :string(255)
#  end_time     :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  cost         :integer(10)
#  min_age      :integer(4)
#  max_age      :integer(4)
#  term_id      :integer(4)
#

class Course < ActiveRecord::Base
  belongs_to :program
  belongs_to :teacher
  belongs_to :location
  belongs_to :term
  
  has_many :registrations
  
  validates_presence_of :program, :teacher, :location, :term, :days_of_week, :start_time, :end_time, :min_age, :max_age, :cost
  
  scope :camp, lambda { |year|
    joins(:term, :program) & Term.summer(year)
  }
  
  scope :younger, lambda {
    where("max_age <= ?", 10)
  }
  
  scope :older, lambda {
    where("min_age > ?", 10)
  }
  
  def is_match?(pid, tid)
    return self.program.id == pid && self.term.id == tid
  end
  
end
