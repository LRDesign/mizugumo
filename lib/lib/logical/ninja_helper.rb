module Logical::NinjaHelper
  require 'logical/ninja_link_helper'
  require 'logical/ninja_helper_railtie'
  ActionController::Base.helper(Logical::NinjaLinkHelper)
end
