class TeachersController < ApplicationController
  respond_to :html, :xml, :json
  load_and_authorize_resource
  
  def index
    @teachers = Teacher.all
    respond_with @teachers
  end

  def show
    @teacher = Teacher.includes(:registrations).find(params[:id])
    respond_with @teacher
  end

  def new
    @teacher = Teacher.new
    respond_with @teacher
  end

  def edit
    respond_with @teacher
  end

  def create
    @teacher = Teacher.new(params[:teacher])
    if @teacher.save
      flash[:success] = "New teacher saved successfully."
    else
      flash[:alert] = "Could not save the new teacher."
    end
    respond_with @teacher, :location => teachers_path
  end

  def update
    if @teacher.update_attributes(params[:teacher])
      flash[:success] = "Updated the teacher successfully."
    else
      flash[:alert] = "Could not update the teacher."
    end
    respond_with @teacher
  end

  def destroy
    @teacher.destroy
    flash[:notice] = "Deleted the teacher from the database."
    respond_with @teacher
  end

end
