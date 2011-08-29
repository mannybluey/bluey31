module ApplicationHelper
  
  def load_controller_js(script = controller.controller_name)
    content_for :extra_js do
      javascript_include_tag "controllers/#{script}"
    end
  end
  
  def error_messages!(object)
      return "" if object.errors.empty?

      messages = object.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
      sentence = I18n.t("errors.messages.not_saved",
                        :count => object.errors.count,
                        :resource => object.class.name)

      html = <<-HTML
      <div id="error_explanation">
        <h2>#{sentence}</h2>
        <ul>#{messages}</ul>
      </div>
      HTML

      html.html_safe
  end
  
end
