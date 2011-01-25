
class NinjaHelperRailtie < Rails::Railtie
  railtie_name :ninja_helper

  rake_tasks do
    load 'tasks/ninja_helper.rake'
  end

  generators do
    require 'generators/rails/ninja_helper/scaffold_controller_generator'
    require 'generators/rails/ninja_helper/erb_generator'
  end
end
