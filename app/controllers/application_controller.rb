class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
  
  def current_ability
    @current_ability ||= Ability.new(current_user)
  end
  
  def current_user
    current_parent || current_teacher
  end
  
end
