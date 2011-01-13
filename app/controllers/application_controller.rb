class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
  
  def current_ability
    @current_ability ||= Ability.new(current_user)
  end
  
  def current_user
    current_parent
  end
  
  def return_back
    redirect_to :back
  rescue ActionController::RedirectBackError
    redirect_to root_path
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "Access denied."
    return_back
  end
  
  
  
end
