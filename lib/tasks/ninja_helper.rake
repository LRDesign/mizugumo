def plugin_path
  File.dirname(__FILE__)
end

def copyfile(src, dest)
  mkdir_p File.dirname(dest), :verbose => false
  cp src, dest, :verbose => false
end

def install_file(file)
  puts "installing #{file}"
  copyfile(
    File.join(plugin_path, '../..', file),
    File.join(Rails.root, 'public', file)
  )
end

namespace :ninja_helper do
  desc "Install NinjaHelper Files"
  task :install => :environment do
    install_file 'javascripts/jquery.ninja_script.js'
    install_file 'javascripts/jquery-1.4.2.js'
    install_file 'stylesheets/ninjascript.css'
    install_file 'stylesheets/sass/ninjascript.sass'
    install_file 'images/ui/spinner.gif'
    # append default behavior to application.js
    puts "done.\n"
  end
end

# shorthand aliases
namespace :nh do
  task :install => "ninja_helper:install"
end



