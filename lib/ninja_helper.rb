p '!!!!!!!!!!!! loading NinjaHelper'
module NinjaHelper
  require 'ninja_link_helper'
  require 'ninja_helper_railtie'
  ActionController::Base.helper(NinjaLinkHelper)
end
