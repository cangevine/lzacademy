class SessionsController < ApplicationController
  respond_to :html, :xml, :json
  
  def index
    @sessions = Session.all
    respond_with @sessions
  end

  def show
    @session = Session.find(params[:id])
    respond_with @session
  end

  def new
    @session = Session.new
    respond_with @session
  end

  def edit
    @session = Session.find(params[:id])
    respond_with @session
  end

  def create
    @session = Session.new(params[:session])
    if @session.save
      flash[:success] = "New session saved successfully."
    else
      flash[:alert] = "Could not save the new session."
    end
    respond_with @session, :location => sessions_path
  end

  def update
    @session = Session.find(params[:id])
    if @session.update_attributes(params[:session])
      flash[:success] = "Updated the session successfully."
    else
      flash[:alert] = "Could not update the session."
    end
    respond_with @session
  end

  def destroy
    @session = Session.find(params[:id])
    @session.destroy
    flash[:notice] = "Deleted the session successfully."
    respond_with @session
  end
end
