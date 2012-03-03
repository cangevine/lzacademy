class Recommendation < ActiveRecord::Base
  belongs_to :student
    
  def completed?
    !self.completed_at.nil?
  end
end
