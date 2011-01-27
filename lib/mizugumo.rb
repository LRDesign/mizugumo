module Mizugumo
  class Railtie < Rails::Railtie
    require 'ninja_link_helper'

    ActionController::Base.helper(NinjaLinkHelper)

    generators do
      require 'generators/rails/mizugumo/scaffold_controller_generator'
      require 'generators/rails/mizugumo/erb_generator'
      require 'generators/mizugumo/install/install_generator'
    end
  end
end
