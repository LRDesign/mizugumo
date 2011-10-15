require 'rails/generators/resource_helpers'

module Mizugumo
  class ScaffoldControllerGenerator < Rails::Generators::NamedBase
    include Rails::Generators::ResourceHelpers
    self.namespace('rails:mizugumo:scaffold_controller')

    source_root File.dirname(__FILE__) + '/templates'

    check_class_collision :suffix => "Controller"

    class_option :orm, :banner => "NAME", :type => :string, :required => true,
    :desc => "ORM to generate the controller for"

    def create_controller_files
      template 'controller.rb', File.join('app/controllers', class_path, "#{controller_file_name}_controller.rb")
    end

    hook_for :template_engine, :test_framework, :in => :rails, :as => :scaffold
    #if Mizugumo::RAILS_31
    hook_for 'assets', :in => :rails, :as => :scaffold
    #end

    # Invoke the helper using the controller name (pluralized)
    hook_for :helper, :in => :rails, :as => :scaffold do |invoked|
      invoke invoked, [ controller_name ]
    end
  end
end
