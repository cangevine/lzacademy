class SchoolController < ApplicationController
  def locations
  end

  def schedule
    @new_eagle_courses = Course.school(2011).younger.all
  end

  def register
    redirect_to new_parent_path
  end

end
