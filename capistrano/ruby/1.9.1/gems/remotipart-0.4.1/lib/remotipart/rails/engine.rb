# Configure Rails 3.1
module Remotipart
  module Rails

    class Engine < ::Rails::Engine
      initializer "remotipart.view_helper" do
        ActionView::Base.send :include, RequestHelper
        ActionView::Base.send :include, ViewHelper
      end

      initializer "remotipart.controller_helper" do
        ActionController::Base.send :include, RequestHelper
      end
    end

  end
end
