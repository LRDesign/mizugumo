require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

namespace :update do
  desc "regenerate the CSS from SASS source"
  task :css do
    sh 'sass lib/generators/mizugumo/install/templates/stylesheets/sass/mizugumo.sass lib/generators/mizugumo/install/templates/stylesheets/mizugumo.css'
  end

  desc "get the most up-to-date version of NinjaScript"
  task :ninja_script do
    #sh 'cd ../NinjaScript; git checkout master; git pull'
    #cp File.join(File.dirname(__FILE__), '..', 'NinjaScript', 'javascript', 'jquery.ninja_script.js'),
       #File.join(File.dirname(__FILE__), 'lib', 'generators', 'mizugumo', 'install', 'templates', 'javascripts')
    mkdir_p 'temp'
    sh 'cd temp; wget --no-check-certificate https://github.com/downloads/LRDesign/NinjaScript/ninjascript.zip'
    sh 'cd temp; unzip ninjascript.zip'     
    cwd = File.dirname(__FILE__)  
    cp File.join(cwd, 'temp', 'generated', 'javascript', 'ninjascript.js'),
       File.join(cwd, 'lib', 'generators', 'mizugumo', 'install', 'templates', 'javascripts')     
  end

  task :ns => :ninja_script
end

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "mizugumo"
  gem.homepage = "http://github.com/LRDesign/mizugumo"
  gem.license = "MIT"
  gem.summary = %Q{Seamless UJS for Rails using NinjaScript}
  gem.description = %Q{Seamless UJS for Rails using NinjaScript}
  gem.email = "evan@lrdesign.com"
  gem.authors = ["Evan Dorn"]
  gem.require_paths = ['lib']
  # Include your dependencies below. Runtime dependencies are required when using your gem,
  # and development dependencies are only needed for development (ie running rake tasks, tests, etc)
  #  gem.add_runtime_dependency 'jabber4r', '> 0.1'
  #  gem.add_development_dependency 'rspec', '> 1.2.3'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

# require 'rcov/rcovtask'
# Rcov::RcovTask.new do |test|
#   test.libs << 'test'
#   test.pattern = 'test/**/test_*.rb'
#   test.verbose = true
# end

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "mizugumo #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
