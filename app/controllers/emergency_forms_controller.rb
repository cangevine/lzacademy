class EmergencyFormsController < ApplicationController
  respond_to :html, :json, :xml
  load_and_authorize_resource

  def show
    @emergency_form = EmergencyForm.find_by_student_id(params[:student_id])
    respond_with @emergency_form
  end

  def new
    @emergency_form = EmergencyForm.new(:student_id => params[:student_id])
    respond_with @emergency_form
  end

  def edit
    @emergency_form = EmergencyForm.find_by_student_id(params[:student_id])
    respond_with @emergency_form
  end

  def create
    @emergency_form = EmergencyForm.new(params[:emergency_form])
    if @emergency_form.save
      flash[:success] = "New emergency form saved successfully."
    else
      flash[:error] = "Could not save the new emergency form."
    end
    @student = Student.find_by_id(params[:emergency_form][:student_id])
    respond_with @emergency_form, :location => parent_path(@student.parent)
  end

  def update
    if @emergency_form.update_attributes(params[:emergency_form])
      flash[:success] = "Updated the emergency form successfully."
    else
      flash[:error] = "Could not update the emergency form."
    end
    @student = Student.find_by_id(params[:emergency_form][:student_id])
    respond_with @emergency_form, :location => parent_path(@student.parent)
  end

  def destroy
    @emergency_form.destroy
    flash[:notice] = "Deleted the emergency form successfully."
    respond_with @emergency_form
  end
end
