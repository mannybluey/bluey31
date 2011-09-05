class ApplicationController < ActionController::Base
  include ControllerExtensions
  protect_from_forgery
  
  #before_filter :ensure_browser_supported unless (Rails.env.test? || Rails.env.cucumber?)
  
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
  
  private
    
  def ensure_browser_supported
    if html? && !user_agent.unknown? && cookies[:browser_unsupported] != 'false' && user_agent.unsupported? && session[:browser_unsupported].blank?
      session[:return_to] = request.fullpath
      render :template => "/layouts/unsupported_browser", :layout => false
    end
  end
  
end
