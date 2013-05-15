
module MizugumoLinkHelper
  include ActionView::Helpers::UrlHelper

  # Redefined link_to to provide Mizugumo-style
  # graceful degradation.   If a :method option
  # was provided, this replaces the link with a form
  # and specifies a class so that MizugumoScript will
  # convert it to the expected link on Javascript-enabled
  # browsers.
  def link_to(*args, &block)
    if block_given?
      options       = args[0] || {}
      html_options  = args[1]
    else
      options       = args[1] || {}
      html_options  = args[2]
    end

    if html_options and html_options[:method]
      degradable_form_for_link(*args, &block)
    else
      super(*args, &block)
    end
  end

  def degradable_form_for_link(*args, &block)
    if block_given?
      return degradable_form_for_link(capture(&block), *args)
    else
      contents = args.shift
      if contents =~ /<img.+src=['"](\S+?)['"]/
        submit_element = image_submit_tag($1)
        title = "block was passed"
      else
        title = contents
        submit_element = button_tag(title, :type => 'submit')
      end
    end
    options       = args[0] || {}
    html_options  = args[1]
    action        = url_for(options)
    # debugger
    method = html_options[:method]

    # debugger

    cssclass      = [ 'mizugumo_graceful_form' ]
    cssclass      << html_options[:class] unless html_options[:class].blank?
    html_options = convert_options_to_data_attributes(options, html_options)
    html_options.merge!({:action => action, :method => :post, :title => title, :class => cssclass})
    html_options.delete('rel')
    html_options.delete('class')

    content_tag(:form, html_options) do
      hidden_field_tag("_method", method) +
      hidden_field_tag("authenticity_token", session[:_csrf_token]) +
      submit_element
    end
  end
end
