module NinjaHelper
  module Generators
    class InstallGenerator < Rails::Generators::Base

      desc <<DESC
Description:
    Copy ninja_helper and NinjaScript files to your application.
DESC

      def self.source_root
        @source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'templates'))
      end

      def copy_files
        directory 'images',     :destination => 'public/'
        directory 'javascripts', :destination => 'public/'
        directory 'stylesheets', :destination => 'public/'
      end

    end
  end
end
