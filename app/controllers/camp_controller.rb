class CampController < ApplicationController
  def locations
  end

  def schedule
    @young_camp_courses = Course.camp(2011).younger.all
    @old_camp_courses = Course.camp(2011).older.all
  end
  
  def typical_day
  end

  def discounts
  end

  def register
  end

end
