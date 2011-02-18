class CommentsController < ApplicationController
  respond_to :html, :xml, :json
  load_and_authorize_resource
  
  def index
    if params[:registration_id]
      @registration = Registration.find(params[:registration_id])
      @published_comments = @registration.comments.published.order("published_at DESC")
      @pending_comments = @registration.comments.pending.order("updated_at DESC")
    else
      @pending_comments = Comment.pending.order("updated_at DESC").all
    end
    respond_with @published_comments, @pending_comments
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
    @registration = Registration.find(params[:registration_id])
    @comment = Comment.find(params[:id])
    respond_with @comment
  end

  def create
    @registration = Registration.find(params[:comment][:registration_id])
    @comment = Comment.new(params[:comment])
    if @comment.save
      flash[:success] = "New comment saved successfully."
      respond_with @comment, :location => teacher_path(@comment.registration.course.teacher)
    else
      flash[:alert] = "Could not save the new comment."
      respond_with @comment, :location => new_registration_comment_path(@registration, @comment)
    end
  end

  def update
    @comment = Comment.find(params[:id])
    
    if @comment.update_attributes(params[:comment])
      flash[:success] = "Updated the comment successfully."
    else
      flash[:alert] = "Could not update the comment."
    end
    respond_with @comment, :location => teacher_path(@comment.registration.course.teacher)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Deleted the comment successfully."
    respond_with @comment
  end
end
