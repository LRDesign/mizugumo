require 'rails/generators/resource_helpers'

p "!!!!!!!!!! Scaffold generator file being loaded "
module NinjaHelper
  class ScaffoldControllerGenerator < Rails::Generators::NamedBase
    include Rails::Generators::ResourceHelpers
    self.namespace('rails:ninja_helper:scaffold_controller')

    source_root File.dirname(__FILE__) + '/templates'

    check_class_collision :suffix => "Controller"

    class_option :orm, :banner => "NAME", :type => :string, :required => true,
    :desc => "ORM to generate the controller for"

    def create_controller_files
      template 'controller.rb', File.join('app/controllers', class_path, "#{controller_file_name}_controller.rb")
    end

    hook_for :template_engine, :test_framework, :in => :rails, :as => :scaffold

    # Invoke the helper using the controller name (pluralized)
    hook_for :helper, :in => :rails, :as => :scaffold do |invoked|
      invoke invoked, [ controller_name ]
    end

    p "Loaded Scaffold Controller Generator, namespace is #{self.namespace}"
  end
end