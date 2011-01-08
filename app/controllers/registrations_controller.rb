class RegistrationsController < ApplicationController
  respond_to :html, :xml, :json
  
  def index
    @registrations = Registration.all
  end

  def new
    @young_camp_courses = Course.camp(2011).younger.all
    @old_camp_courses = Course.camp(2011).older.all
    
    @registration = Registration.new
    @registration.student_id = params[:student_id] unless params[:student_id].nil?
  end

  def create
    @registration = Registration.new(params[:registration])
    if @registration.save
      flash[:success] = "Registration information saved."
    else
      flash[:error] = "Could not save your registration information."
    end
    respond_with @registration
  end

  def show
    @registration = Registration.find(params[:id])
    respond_with @registration
  end

  def edit
  end

  def update
  end

  def destroy
    @registration = Registration.find(params[:id])
    @registration.destroy
    flash[:notice] = "The registration has been cancelled."
    respond_with @registration, :location => :back
  end

end
