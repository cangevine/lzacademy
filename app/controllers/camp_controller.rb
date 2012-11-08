class CampController < ApplicationController
  def locations
  end

  def schedule
    @young_camp_courses = Course.camp(2013).younger.order("programs.language ASC").all
    @old_camp_courses = Course.camp(2013).older.order("programs.language ASC").all
  end
  
  def typical_day
  end

  def discounts
  end

  def register
  end

end
