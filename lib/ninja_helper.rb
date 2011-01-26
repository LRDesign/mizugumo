module NinjaHelper
  class Railtie < Rails::Railtie
    require 'ninja_link_helper'

    ActionController::Base.helper(NinjaLinkHelper)

    rake_tasks do
      load 'tasks/ninja_helper.rake'
    end

    generators do
      require 'generators/rails/ninja_helper/scaffold_controller_generator'
      require 'generators/rails/ninja_helper/erb_generator'
      require 'generators/ninja_helper/install/install_generator'
    end
  end
end
