# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ninja_helper}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Evan Dorn"]
  s.date = %q{2011-01-25}
  s.description = %q{Seamless UJS for Rails using NinjaScript}
  s.email = %q{evan@lrdesign.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "docs/making_generators.txt",
    "images/ui/spinner.gif",
    "javascripts/jquery-1.4.2.js",
    "javascripts/jquery.ninja_script.js",
    "lib/generators/rails/ninja_helper/erb_generator.rb",
    "lib/generators/rails/ninja_helper/scaffold_controller_generator.rb",
    "lib/generators/rails/ninja_helper/templates/_form.html.erb",
    "lib/generators/rails/ninja_helper/templates/_form.html.haml",
    "lib/generators/rails/ninja_helper/templates/_row.html.erb",
    "lib/generators/rails/ninja_helper/templates/_row.html.haml",
    "lib/generators/rails/ninja_helper/templates/controller.rb",
    "lib/generators/rails/ninja_helper/templates/create.js.erb",
    "lib/generators/rails/ninja_helper/templates/destroy.js.erb",
    "lib/generators/rails/ninja_helper/templates/edit.html.erb",
    "lib/generators/rails/ninja_helper/templates/edit.html.haml",
    "lib/generators/rails/ninja_helper/templates/edit.js.erb",
    "lib/generators/rails/ninja_helper/templates/index.html.erb",
    "lib/generators/rails/ninja_helper/templates/index.html.haml",
    "lib/generators/rails/ninja_helper/templates/new.html.erb",
    "lib/generators/rails/ninja_helper/templates/new.html.haml",
    "lib/generators/rails/ninja_helper/templates/new.js.erb",
    "lib/generators/rails/ninja_helper/templates/show.html.erb",
    "lib/generators/rails/ninja_helper/templates/show.html.haml",
    "lib/generators/rails/ninja_helper/templates/update.js.erb",
    "lib/logical/ninja_helper.rb",
    "lib/logical/ninja_helper_railtie.rb",
    "lib/logical/ninja_link_helper.rb",
    "lib/tasks/ninja_helper.rake",
    "ninja_helper.gemspec",
    "stylesheets/ninjascript.css",
    "stylesheets/ninjascript.sass",
    "stylesheets/sass/ninjascript.sass"
  ]
  s.homepage = %q{http://github.com/IdahoEv/ninja_helper}
  s.licenses = ["MIT"]
  s.require_paths = ["lib/logical/ninja_helper"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Seamless UJS for Rails using NinjaScript}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 1.5"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 1.5"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_dependency(%q<rcov>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 1.5"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
    s.add_dependency(%q<rcov>, [">= 0"])
  end
end

