class RegistrationsController < Devise::RegistrationsController 
    
  #before_filter :store_location 
        
# GET /resource/sign_up
  def new
    resource = build_resource({})
    respond_with_navigational(resource){ render_with_scope :new }
  end

  # POST /resource
  def create
    build_resource

    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_in(resource_name, resource)
        respond_with resource, :location => redirect_location(resource_name, resource)
      else
        set_flash_message :notice, :inactive_signed_up, :reason => inactive_reason(resource) if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords(resource)
      respond_with_navigational(resource) { render_with_scope :new }
    end
  end
       
     # POST /resource/sign_up   js or html
  def create
    build_resource
    respond_to do |format|
      format.html {
      if resource.save
          if resource.active_for_authentication?
            set_flash_message :notice, :signed_up if is_navigational_format?
            sign_in(resource_name, resource)
            respond_with resource, :location => redirect_location(resource_name, resource)
          else
            set_flash_message :notice, :inactive_signed_up, :reason => inactive_reason(resource) if is_navigational_format?
            expire_session_data_after_sign_in!
            respond_with resource, :location => after_inactive_sign_up_path_for(resource)
          end
        else
          clean_up_passwords(resource)
          respond_with_navigational(resource) { render_with_scope :new }
        end
      }         
      format.js  {
        if resource.save
          if resource.active_for_authentication?
            #set_flash_message :notice, :signed_up if is_navigational_format?
            set_flash_message :notice, :signed_up
            sign_in(resource_name, resource)
            @url = root_url
            render  :action => 'signed_up.js'
          else
            #set_flash_message :notice, :inactive_signed_up, :reason => inactive_reason(resource) if is_navigational_format?
            set_flash_message :notice, :inactive_signed_up, :reason => inactive_reason(resource) 
            expire_session_data_after_sign_in!
            @url = root_url
            render  :action => 'signed_up.js'
          end
        else
          clean_up_passwords(resource)
          @user = resource
          render  :action => 'registration_failed.js'
        end
      }
    end
  end
     
  
end