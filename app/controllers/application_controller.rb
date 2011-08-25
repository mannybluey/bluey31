class ApplicationController < ActionController::Base
  protect_from_forgery
  
  
  def after_sign_in_path_for(resource)
    if resource.sign_in_count == 1
      default_path = profile_edit_path
    else
      default_path = dashboard_path
    end
    stored_location_for(:user) || default_path
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to '/unauthorised.html'
  end
  
end
