class CommentsController < ApplicationController
  respond_to :html, :xml, :json
  
  def index
    @registration = Registration.find(params[:registration_id])
    @comments = Comment.find_by_registration_id(params[:registration_id]).published
    respond_with @comments
  end

  def show
    @comment = Comment.find(params[:id])
    respond_with @comment
  end

  def new
    @comment = Comment.new
    @registration = Registration.includes(:student).find(params[:registration_id]) unless params[:registration_id].nil?
    @comment.registration_id = params[:registration_id] unless params[:registration_id].nil?
    @comment.published = 0
    respond_with @comment
  end

  def edit
    @comment = Comment.find(params[:id])
    respond_with @comment
  end

  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      flash[:success] = "New comment saved successfully."
    else
      flash[:alert] = "Could not save the new comment."
    end
    respond_with @comment, :location => teacher_path(@comment.registration.course.teacher)
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:success] = "Updated the comment successfully."
    else
      flash[:alert] = "Could not update the comment."
    end
    respond_with @comment
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Deleted the comment successfully."
    respond_with @comment
  end
end
