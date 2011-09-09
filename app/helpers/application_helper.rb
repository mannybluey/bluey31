module ApplicationHelper
  
  def load_controller_js(script = controller.controller_name)
    content_for :extra_js do
     # javascript_include_tag "controllers/#{script}"
    end
  end

  def dashboard_menu(params, items)
    return items.include?(params[:controller]) ? 'active' : ''
  end
  

  
end

