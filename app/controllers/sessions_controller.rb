class SessionsController < Devise::SessionsController 
  
  skip_before_filter :ensure_browser_supported
  
  # GET /resource/sign_in
  def new
    resource = build_resource
    clean_up_passwords(resource)
    respond_with_navigational(resource, stub_options(resource)){ render_with_scope :new }
  end
  

  def create
    resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
    warden.raw_session[:return_to] = nil
    respond_to do |format|
      format.html{ 
        redirect_location(resource_name, resource)
       }
      format.js {
        set_flash_message :notice, :signed_in
        @url = session[:return_to].nil? ? root_url : url_for(session[:return_to])
        render :action => "signed_in.js"
      }
    end
  end
 
  def failure
    respond_to do |format|
      format.html{ redirect_to :action => :new }
      format.js { 
        @error_msg = "Invalid email or password"
        render :action => "signin_failed.js"
      }
    end
  end
  
    # POST /continue
  def continue
    if params[:show_unsupported_browser_notice_message].nil?
      cookies[:browser_unsupported] = { :value => "false", :expires => 2.years.from_now }
    else
      cookies.delete :browser_unsupported
    end
    session[:browser_unsupported] = true
    redirect_to session[:return_to] || root_url
  end
   
end