class StudentsController < ApplicationController
  respond_to :html, :xml, :json
  load_and_authorize_resource
  
  def index
    @students = Student.all
    respond_with @students
  end

  def show
    respond_with @student
  end

  def new
    @student = Student.new
    @student.parent_id = params[:parent_id] unless params[:parent_id].nil?
    respond_with @student
  end

  def edit
    respond_with @student
  end

  def create
    @student = Student.new(params[:student])
    if @student.save
      flash[:success] = "Student information saved successfully."
    else
      flash[:alert] = "Sorry! We could not save the new student information."
    end
    respond_with @student
  end

  def update
    if @student.update_attributes(params[:student])
      flash[:success] = "Updated the student successfully."
    else
      flash[:alert] = "Could not update the student."
    end
    respond_with @student
  end

  def destroy
    @student.destroy
    flash[:notice] = "Deleted the student successfully."
    respond_with @student
  end
end
