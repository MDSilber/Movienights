class WrappedPasswordInput < Formtastic::Inputs::PasswordInput

  def to_html
	  input_wrapping do
		label_html << 
		template.content_tag(:div, builder.password_field(method, input_html_options), :class => "field-container")
	  end
  end
end
