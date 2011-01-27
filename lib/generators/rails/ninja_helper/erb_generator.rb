require 'rails/generators/resource_helpers'
require 'generators/rails/mizugumo/view_generator'

module NinjaHelper
  class ErbGenerator < ViewGenerator
    include ::Rails::Generators::ResourceHelpers

    self.namespace("rails:mizugumo:erb")
    source_root File.dirname(__FILE__) + '/templates'

    def copy_html_view_files
      HTML_VIEWS.each do |view|
        filename = "#{view}.html.erb"
        template filename, File.join("app/views", controller_file_path, filename)
      end
      filename = "_#{singular_table_name}.html.erb"
      template "_row.html.erb", File.join("app/views", controller_file_path, filename)
    end

  end
end
