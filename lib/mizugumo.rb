module Mizugumo
  RAILS_31 = Rails.version =~ /3\.1\./

  class Railtie < Rails::Railtie   
    require 'mizugumo_link_helper'


    ActionController::Base.helper(MizugumoLinkHelper)

    generators do     
      require 'generators/rails/mizugumo/scaffold_controller_generator'
      require 'generators/rails/mizugumo/erb_generator'
      require 'generators/mizugumo/install/install_generator'
    end
  end
end
