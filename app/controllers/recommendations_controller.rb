class RecommendationsController < ApplicationController
  respond_to :html, :json, :xml

  def show
    @recommendation = Recommendation.find_by_student_id(params[:student_id])
    respond_with @recommendation
  end

  def new
    @recommendation = Recommendation.new(:student_id => params[:student_id])
    respond_with @recommendation
  end

  def edit
    @valid_guid = false
    unless params[:guid].nil?
      @recommendation = Recommendation.find_by_guid(params[:guid])
      @student = Student.find(params[:student_id])
      unless @recommendation.nil?
        @valid_guid = true
      end
    end
    unless @valid_guid
      @recommendation = Recommendation.find_by_student_id(params[:student_id])
    end
    respond_with @recommendation, @student
  end

  def create
    @recommendation = Recommendation.new(params[:recommendation])
    @recommendation.last_emailed_at = Time.now
    @recommendation.guid = rand(36**24).to_s(36)
    @student = Student.find(@recommendation.student_id)
    if @recommendation.save
      RecommendationMailer.teacher_request_notice(@recommendation, @student).deliver
      flash[:success] = "The teacher has been notified about your request."
    else
      flash[:error] = "Could not save your request for the new recommendation form."
    end
    @student = Student.find_by_id(params[:recommendation][:student_id])
    respond_with @recommendation, :location => parent_path(@student.parent)
  end

  def update
    @recommendation = Recommendation.find(params[:id])
    @student = Student.find(@recommendation.student_id)
    
    if params[:recommendation][:guid].nil?
      @recommendation.last_emailed_at = Time.now
      if @recommendation.update_attributes(params[:recommendation])
        RecommendationMailer.teacher_request_notice(@recommendation, @student).deliver
        flash[:success] = "Updated and re-sent the recommendation form successfully."
      else
        flash[:error] = "Could not update the recommendation form."
      end
      @student = Student.find_by_id(params[:recommendation][:student_id])
      respond_with @recommendation, :location => parent_path(@student.parent)
    
    else
      @recommendation.completed_at = Time.now
      if @recommendation.update_attributes(params[:recommendation])
        RecommendationMailer.teacher_thank_you_notice(@recommendation, @student).deliver
        flash[:success] = "Your recommendation form has been saved successfully."
      else
        flash[:error] = "Could not save the recommendation form."
      end
      @student = Student.find_by_id(params[:recommendation][:student_id])
      respond_with @recommendation, :location => thank_you_student_recommendation_path(@student)
    end
  end
  
  def thank_you
  end

  def destroy
    @recommendation.destroy
    flash[:notice] = "Deleted the recommendation form successfully."
    respond_with @recommendation
  end
end