class TermsController < ApplicationController
  respond_to :html, :xml, :json
  load_and_authorize_resource
  
  def index
    @terms = Term.all
    respond_with @terms
  end

  def show
    respond_with @term
  end

  def new
    @term = Term.new
    respond_with @term
  end

  def edit
    respond_with @term
  end

  def create
    @term = Term.new(params[:term])
    if @term.save
      flash[:success] = "New term saved successfully."
    else
      flash[:alert] = "Could not save the new term."
    end
    respond_with @term, :location => terms_path
  end

  def update
    if @term.update_attributes(params[:term])
      flash[:success] = "Updated the term successfully."
    else
      flash[:alert] = "Could not update the term."
    end
    respond_with @term
  end

  def destroy
    @term.destroy
    flash[:notice] = "Deleted the term successfully."
    respond_with @term
  end
end
