class CoursesController < ApplicationController
  respond_to :html, :xml, :json
  
  def index
    @courses = Course.all
    respond_with @courses
  end

  def show
    @course = Course.find(params[:id])
    respond_with @course
  end

  def new
    @course = Course.new
    respond_with @course
  end

  def edit
    @course = Course.find(params[:id])
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
    @course = Course.find(params[:id])
    if @course.update_attributes(params[:course])
      flash[:success] = "Updated the course successfully."
    else
      flash[:alert] = "Could not update the course."
    end
    respond_with @course
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    flash[:notice] = "Deleted the course successfully."
    respond_with @course
  end
end
