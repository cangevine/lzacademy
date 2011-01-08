class StudentsController < ApplicationController
  respond_to :html, :xml, :json
  
  def index
    @students = Student.all
    respond_with @students
  end

  def show
    @student = Student.find(params[:id])
    respond_with @student
  end

  def new
    @student = Student.new
    @student.parent_id = params[:parent_id] unless params[:parent_id].nil?
    respond_with @student
  end

  def edit
    @student = Student.find(params[:id])
    respond_with @student
  end

  def create
    @student = Student.new(params[:student])
    if @student.save
      flash[:success] = "Student information saved successfully."
    else
      flash[:error] = "Sorry! We could not save the new student information."
    end
    respond_with @student
  end

  def update
    @student = Student.find(params[:id])
    if @student.update_attributes(params[:student])
      flash[:success] = "Updated the student successfully."
    else
      flash[:error] = "Could not update the student."
    end
    respond_with @student
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    flash[:notice] = "Deleted the student successfully."
    respond_with @student
  end
end
