class SessionTermsController < ApplicationController
  respond_to :html, :xml, :json
  load_and_authorize_resource
  
  def index
    @session_terms = SessionTerm.all
    respond_with @session_terms
  end

  def show
    respond_with @session_term
  end

  def new
    @session_term = SessionTerm.new
    respond_with @session_term
  end

  def edit
    respond_with @session_term
  end

  def create
    @session_term = SessionTerm.new(params[:session_term])
    if @session_term.save
      flash[:success] = "New session saved successfully."
    else
      flash[:alert] = "Could not save the new session."
    end
    respond_with @session_term, :location => session_terms_path
  end

  def update
    if @session_term.update_attributes(params[:session_term])
      flash[:success] = "Updated the session successfully."
    else
      flash[:alert] = "Could not update the session."
    end
    respond_with @session_term
  end

  def destroy
    @session_term.destroy
    flash[:notice] = "Deleted the session successfully."
    respond_with @session_term
  end
end
