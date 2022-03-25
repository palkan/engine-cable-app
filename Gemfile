source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "~> 3.1.0"

gem "rails", "~> 7.0.0"

# Incompatible changes with Psych 4.0.0 and Ruby 3.1.0
# https://bugs.ruby-lang.org/issues/17866
gem "psych", "< 4"
# Use Puma as the app server
gem 'puma', '~> 3.11'
# CSS in Rails with Tailwind, PostCSS, and Sass via Node.js.
gem "cssbundling-rails"
# Modern Rails assets pipeline
gem "propshaft"
# Manage modern JavaScript in Rails without transpiling or bundling.
gem "importmap-rails"
# Use Stimulus in your Ruby on Rails app
gem "stimulus-rails"

gem 'high_voltage'

gem 'faker'

gem 'martians', path: "engines/martians"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[mri mingw x64_mingw]
end
