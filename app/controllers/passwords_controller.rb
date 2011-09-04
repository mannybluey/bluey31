class PasswordsController < Devise::PasswordsController

  respond_to :html, :js
    
    # GET /resource/password/new
  def new
    build_resource({})
    render_with_scope :new
  end
  
    # POST /resource/password
  def create
    # try send an email with instruction
    self.resource = resource_class.send_reset_password_instructions(params[resource_name])
    if resource.errors.empty?
      set_flash_message(:notice, :send_instructions) if is_navigational_format?
      #respond_with resource, :location => new_session_path(resource_name)
      flash[:notice] = I18n.t("devise.passwords.send_instructions")
      respond_with resource do |format|
         format.html{ redirect_to new_session_path(resource_name)}
         format.js { 
          redirect_to root_url
        }
      end
    else
     # respond_with_navigational(resource) do |format|
      respond_with resource do |format|
        format.html { 
          render_with_scope :new 
        }
        format.js { 
          @error_msg = "Email " + resource.errors[:email].first
          render :action => "password_failed.js"
        }
      end
    end
  end
      
  
end