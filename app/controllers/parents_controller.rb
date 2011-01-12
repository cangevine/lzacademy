class ParentsController < ApplicationController
  respond_to :html, :xml, :json
  
  before_filter :authenticate_parent!
  
  def index
    @parents = Parent.all
    respond_with @parents
  end

  def show
    @parent = Parent.includes(:students, :registrations).find(params[:id])
    respond_with @parent
  end

  def new
    @young_camp_courses = Course.camp(2011).younger.all
    @old_camp_courses = Course.camp(2011).older.all
    
    @parent = Parent.new
    @parent.students.build
    respond_with @parent
  end

  def edit
    @parent = Parent.find(params[:id])
    respond_with @parent
  end

  def create
    @parent = Parent.new(params[:parent])
    logger.debug params[:parent]
    if @parent.save
      flash[:success] = "Information saved successfully."
      respond_with @parent, :location => parent_path(@parent)
    else
      flash[:alert] = "We could not save your information. Please check for errors below."
      respond_with @parent, :location => new_parent_path
    end
  end

  def update
    @parent = Parent.find(params[:id])
    if @parent.update_attributes(params[:parent])
      flash[:success] = "Updated your information successfully."
    else
      flash[:alert] = "Sorry! We couldn't save your information."
    end
    respond_with @parent
  end

  def destroy
    @parent = Parent.find(params[:id])
    @parent.destroy
    flash[:notice] = "Deleted the parent successfully."
    respond_with @parent
  end
end
