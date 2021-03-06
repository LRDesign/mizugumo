module Mizugumo
  module Generators
    class InstallGenerator < Rails::Generators::Base

      desc <<DESC
Description:
Copy mizugumo and NinjaScript files to your application.
DESC

      def self.source_root
        @source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'templates'))
      end

      def copy_files
        if Mizugumo::RAILS_31
          directory 'images',      'public/images'
          copy_file 'javascripts/ninjascript.js', 'app/assets/javascripts/ninjascript.js'
          copy_file 'javascripts/mizugumo.js', 'app/assets/javascripts/mizugumo.js'
          copy_file 'javascripts/ninja_go.js', 'app/assets/javascripts/ninja_go.js'
          directory 'stylesheets', 'app/assets/stylesheets'
          @manifest = 'app/assets/javascripts/application.js'
          insert_into_file(@manifest, :after => '//= require jquery_ujs') do
            "\n//= require ninjascript" +
            "\n//= require mizugumo"
          end
          append_to_file(@manifest){ '//= require ninja_go' }
        else          
          directory 'images',     'public/images'
          copy_file 'javascripts/jquery-1.6.4.min.js', 'public/javascripts/jquery-1.6.4.min.js'
          copy_file 'javascripts/ninjascript.js', 'public/javascripts/ninjascript.js'
          directory 'stylesheets', 'public/stylesheets'
        end
      end

      def add_javascript_rails_3_0
        return if Mizugumo::RAILS_31

        file = File.join("public", "javascripts", "application.js")
        
        mg_file = File.open(File.join(InstallGenerator.source_root, "javascripts", "mizugumo.js"))
        append_to_file(file) do
          mg_file.read
        end
        mg_file.close
        insert_into_file(file, :after => '});') do
           "\n  Ninja.go(); // This must be the last line of your NinjaScript definitions!"
        end 
      end

      def reminder
        if Mizugumo::RAILS_31
          say (<<NOTICE )

Mizugumo is installed!

Javascript files have been added to your app/assets/javascripts directory.   You may need to check them for compatibility with your
other JS files. 

A few default style rules have been added as well as app/assets/stylesheets/mizugumo.sass.

If you want to use the Mizugumo AJAX scaffold generators, add this to your application.rb:

  config.generators do |g|
    g.scaffold_controller 'mizugumo:scaffold_controller'
    g.template_engine 'mizugumo:erb'    
    # g.template_engine 'mizugumo:haml' # If you prefer Haml over ERB
    g.assets 'mizugumo:js_assets'    
  end

NOTICE
        else
          say (<<NOTICE

Mizugumo is installed!
Remember to remove the default JS and link to the jQuery/NinjaScript script and CSS files by adding these to your application layout.  Note: it is important that ninjascript load after jquery, but before your application.js or any mizugumo-related code you write!

  <%= stylesheet_link_tag 'mizugumo.css' %>
  <%= javascript_include_tag 'jquery-1.6.4.min.js' %>
  <%= javascript_include_tag 'ninjascript.js' %>
  <%= javascript_include_tag 'rails.js' %>
  <%= javascript_include_tag 'application.js' %>

The included rails.js is a jQuery compatible implementation of rails.js, and should replace the default rails.js.
If you want to use the Mizugumo AJAX scaffold generators, add this to your application.rb:

  config.generators do |g|
    g.scaffold_controller 'mizugumo:scaffold_controller'
    g.template_engine 'mizugumo:erb'
    # g.template_engine 'mizugumo:haml' # If you prefer Haml over ERB
  end

NOTICE
        )
        end
      end
    end
  end
end
