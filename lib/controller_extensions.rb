# Every Blueyfit app controller gets this behaviour. This allows us to not subclass ApplicationController.
#
module ControllerExtensions
  include Uaid::Helper
  

  def self.included(base)
    install_helpers(base)
  end

  # Essentials. Installed into every controller.
  def self.install_helpers(base)
    base.module_eval do
      rescue_from 'ActionController::RoutingError',  :with => :render_not_found
      helper :application
      helper_method :browser
      helper_method :logged_in?, :admin?
    end
  end

  # More expensive requests, not to be installed on pages which may be cached
  # (like those of the website).
  def self.install_filters(base)
    base.module_eval do
      before_filter :set_time_zone
    end
  end

  protected

  def display_message(*args)
    flash_entries = args.extract_options!
    shared_message_template = args.pop
    redirect = args.first

    flash[:message] = shared_message_template
    flash.update flash_entries
    redirect_to redirect if redirect
  end

  def display_message_now(*args)
    flash_entries = args.extract_options!
    shared_message_template = args.pop
    action = args.first

    flash.now[:message] = shared_message_template
    flash_entries.each do |k,v|
      flash.now[k] = v
    end
    render :action => action if action
  end

  def render_not_found
    if html?
      render :template => '/errors/not_found', :status => 404
    else
      render :text => '404 Not Found', :status => 404
    end
  end

  def html?
    params[:format].blank? || params[:format] == 'html'
  end

  def set_time_zone
   # Time.zone = current_user.setting.time_zone if user_signed_in?
  end

end

module ActionControllerExtra
  module UserLogger
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      # Logs that a user requested the current action:
      #
      #   MyController < ApplicationController
      #     user_logger
      #   end
      #
      # The same options for ActionController::Filters are available. For example,
      # to only log the user in the create and destroy actions:
      #
      #   MyController < ApplicationController
      #     user_logger :only => [:create, :destroy]
      #   end
      #
      def user_logger(options = {})
        include InstanceMethods
        before_filter :log_user, options
      end
    end

    module InstanceMethods
      def log_user
        logger.info("#{session[:username]} requested #{controller_name}/#{action_name}")
      end
    end
  end
end

