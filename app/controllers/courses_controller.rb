class CoursesController < ApplicationController
  respond_to :html, :xml, :json
  load_and_authorize_resource
  
  def index
    @summer_fcs_young_1 = Course.younger.camp(2013).during("Session 1").order("programs.language ASC").all
    @summer_fcs_young_2 = Course.younger.camp(2013).during("Session 2").order("programs.language ASC").all
    @summer_fcs_old_1 = Course.older.camp(2013).during("Session 1").order("programs.language ASC").all
    @summer_fcs_old_2 = Course.older.camp(2013).during("Session 2").order("programs.language ASC").all
  end
  
  def overview
    @summer_fcs_young_1 = Course.younger.camp(2013).during("Session 1")#.order("count(registrations) DESC").all
    @summer_fcs_young_2 = Course.younger.camp(2013).during("Session 2")#.order("count(registrations) DESC").all
    @summer_fcs_old_1 = Course.older.camp(2013).during("Session 1")#.order("count(registrations) DESC").all
    @summer_fcs_old_2 = Course.older.camp(2013).during("Session 2")#.order("count(registrations) DESC").all
  end

  def show
    respond_with @course
  end

  def new
    @course = Course.new(:teacher_id => 1, :location_id => 4, :days_of_week => "Mon - Fri", 
                          :start_time => "8:30", :end_time => "3:30", :cost => "1425")
    respond_with @course
  end

  def edit
    respond_with @course
  end

  def create
    @course = Course.new(params[:course])
    if @course.save
      flash[:success] = "New course saved successfully."
    else
      flash[:alert] = "Could not save the new course."
    end
    respond_with @course, :location => courses_path
  end

  def update
    if @course.update_attributes(params[:course])
      flash[:success] = "Updated the course successfully."
    else
      flash[:alert] = "Could not update the course."
    end
    respond_with @course
  end

  def destroy
    @course.destroy
    flash[:notice] = "Deleted the course successfully."
    respond_with @course
  end
end
