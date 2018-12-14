$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "martians/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "martians"
  spec.version     = Martians::VERSION
  spec.authors     = ["Vladimir Dementyev"]
  spec.email       = ["dementiev.vm@gmail.com"]
  spec.summary     = "i don't need it"
  spec.description = "i don't need it"
  spec.license     = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails"

  spec.add_development_dependency "sqlite3"
end
