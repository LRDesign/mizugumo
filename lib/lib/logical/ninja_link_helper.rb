module Logical::NinjaLinkHelper
  include ActionView::Helpers::UrlHelper

  # Redefined link_to to provide Ninja-style
  # graceful degradation.   If a :method option
  # was provided, this replaces the link with a form
  # and specifies a class so that NinjaScript will
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
        submit_element = submit_tag(title)
      end
    end
    options       = args[0] || {}
    html_options  = args[1]
    action        = url_for(options)
    cssclass      = [ 'ninja graceful_form' ]
    cssclass      << html_options[:class] unless html_options[:class].blank?

    content_tag(:form,  :action => action, :method => :post, :title => title, :class => cssclass) do
      hidden_field_tag("_method", html_options[:method]) +
      hidden_field_tag("authenticity_token", session[:_csrf_token]) +
      submit_element
    end
  end
end

