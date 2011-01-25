require 'rails/generators/resource_helpers'

module NinjaHelper
  class ErbGenerator < Rails::Generators::NamedBase
    include Rails::Generators::ResourceHelpers

    self.namespace("rails:ninja_helper:erb")
    source_root File.dirname(__FILE__) + '/templates'
    argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"


    check_class_collision :suffix => "Controller"

    class_option :orm, :banner => "NAME", :type => :string, :required => true,
    :desc => "ORM to generate the controller for"

    def create_root_folder
      empty_directory File.join("app/views", controller_file_path)
    end

    def copy_view_files
      erb_views.each do |view|
        filename = "#{view}.html.erb"
        say "templating filename #{filename}"
        template filename, File.join("app/views", controller_file_path, filename)
      end
      js_views.each do |view|
        filename = "#{view}.js.erb"
        say "templating filename #{filename}"
        template filename, File.join("app/views", controller_file_path, filename)
      end
      filename = "_#{singular_table_name}.html.erb"
      say "templating filename #{filename}"
      template "_row.html.erb", File.join("app/views", controller_file_path, filename)
    end

    protected

    def erb_views
      %w(index edit show new _form)
    end

    def js_views
      %w(create destroy edit new update)
    end

  end
end
