# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "format_validators"
  s.version = "0.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jeremiah Hemphill", "Cloudspace Team"]
  s.date = "2012-04-04"
  s.description = "Active Record format validators for inputs that require complex tests such as email and phone numbers."
  s.email = "jeremiah@cloudspace.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rspec",
    "CHANGELOG",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "app/validators/currency_format_validator.rb",
    "app/validators/days_of_week_validator.rb",
    "app/validators/florida_counties_validator.rb",
    "app/validators/phone_format_validator.rb",
    "app/validators/ssn_format_validator.rb",
    "app/validators/zipcode_format_validator.rb",
    "format_validators.gemspec",
    "lib/format_validators.rb",
    "lib/format_validators/engine.rb",
    "lib/format_validators/railtie.rb",
    "spec/dummy/Rakefile",
    "spec/dummy/app/controllers/application_controller.rb",
    "spec/dummy/app/helpers/application_helper.rb",
    "spec/dummy/app/models/building.rb",
    "spec/dummy/app/views/layouts/application.html.erb",
    "spec/dummy/config.ru",
    "spec/dummy/config/application.rb",
    "spec/dummy/config/boot.rb",
    "spec/dummy/config/database.yml",
    "spec/dummy/config/environment.rb",
    "spec/dummy/config/environments/development.rb",
    "spec/dummy/config/environments/production.rb",
    "spec/dummy/config/environments/test.rb",
    "spec/dummy/config/initializers/backtrace_silencers.rb",
    "spec/dummy/config/initializers/inflections.rb",
    "spec/dummy/config/initializers/mime_types.rb",
    "spec/dummy/config/initializers/secret_token.rb",
    "spec/dummy/config/initializers/session_store.rb",
    "spec/dummy/config/locales/en.yml",
    "spec/dummy/config/routes.rb",
    "spec/dummy/db/development.sqlite3",
    "spec/dummy/db/migrate/20120321134932_create_buildings.rb",
    "spec/dummy/db/schema.rb",
    "spec/dummy/db/test.sqlite3",
    "spec/dummy/public/404.html",
    "spec/dummy/public/422.html",
    "spec/dummy/public/500.html",
    "spec/dummy/public/favicon.ico",
    "spec/dummy/public/javascripts/application.js",
    "spec/dummy/public/javascripts/controls.js",
    "spec/dummy/public/javascripts/dragdrop.js",
    "spec/dummy/public/javascripts/effects.js",
    "spec/dummy/public/javascripts/prototype.js",
    "spec/dummy/public/javascripts/rails.js",
    "spec/dummy/public/stylesheets/.gitkeep",
    "spec/dummy/script/rails",
    "spec/format_validators_spec.rb",
    "spec/spec_helper.rb",
    "spec/support/basic_record.rb",
    "spec/validators/currency_format_validator_spec.rb",
    "spec/validators/days_of_week_validator_spec.rb",
    "spec/validators/florida_counties_integration_spec.rb",
    "spec/validators/florida_counties_spec.rb",
    "spec/validators/phone_format_validator_spec.rb",
    "spec/validators/ssn_format_validator_spec.rb",
    "spec/validators/zipcode_format_validator_spec.rb"
  ]
  s.homepage = "http://github.com/jeremiahishere/format_validators"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.15"
  s.summary = "Complex format validators"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 3.0.7"])
      s.add_development_dependency(%q<capybara>, [">= 0.4.0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_development_dependency(%q<ruby-debug19>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.6.0"])
      s.add_development_dependency(%q<rspec-rails>, ["~> 2.6.1"])
      s.add_development_dependency(%q<shoulda>, ["~> 3.0.0"])
      s.add_development_dependency(%q<ruby_parser>, ["~> 2.3.1"])
      s.add_development_dependency(%q<ZenTest>, [">= 0"])
      s.add_development_dependency(%q<autotest-rails>, [">= 0"])
    else
      s.add_dependency(%q<rails>, [">= 3.0.7"])
      s.add_dependency(%q<capybara>, [">= 0.4.0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_dependency(%q<ruby-debug19>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.6.0"])
      s.add_dependency(%q<rspec-rails>, ["~> 2.6.1"])
      s.add_dependency(%q<shoulda>, ["~> 3.0.0"])
      s.add_dependency(%q<ruby_parser>, ["~> 2.3.1"])
      s.add_dependency(%q<ZenTest>, [">= 0"])
      s.add_dependency(%q<autotest-rails>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3.0.7"])
    s.add_dependency(%q<capybara>, [">= 0.4.0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
    s.add_dependency(%q<ruby-debug19>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.6.0"])
    s.add_dependency(%q<rspec-rails>, ["~> 2.6.1"])
    s.add_dependency(%q<shoulda>, ["~> 3.0.0"])
    s.add_dependency(%q<ruby_parser>, ["~> 2.3.1"])
    s.add_dependency(%q<ZenTest>, [">= 0"])
    s.add_dependency(%q<autotest-rails>, [">= 0"])
  end
end

