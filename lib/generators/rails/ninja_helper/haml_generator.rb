require 'rails/generators/resource_helpers'
require 'generators/rails/mizugumo/view_generator'

module NinjaHelper
  class HamlGenerator < ViewGenerator
    include ::Rails::Generators::ResourceHelpers

    self.namespace("rails:mizugumo:haml")
    source_root File.dirname(__FILE__) + '/templates'

    def copy_html_view_files
      HTML_VIEWS.each do |view|
        filename = "#{view}.html.haml"
        template filename, File.join("app/views", controller_file_path, filename)
      end
      filename = "_#{singular_table_name}.html.haml"
      template "_row.html.haml", File.join("app/views", controller_file_path, filename)
    end

  end
end
