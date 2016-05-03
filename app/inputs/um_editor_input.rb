class UmEditorInput
  include Formtastic::Inputs::Base
  def to_html
    form_name = "#{object_name}[#{method}]"
    height = options[:height] || "300px"
    width = options[:width] || "80%"

    html = %Q[<div class="wrap" style="display:inline-block; height:#{height}; width:#{width}">]
    html << %Q[<script id="container" name="#{form_name}" type="text/plain" style="width:100%;height:#{height}">]
    html << (options[:input_html].try(:[], :value) || @object.send(method)).to_s
    html << '</script>'
    html << '</div>'

    input_wrapping do
      label_html << html.html_safe
    end
  end
end
