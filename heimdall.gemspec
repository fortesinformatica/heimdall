$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "heimdall/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "heimdall"
  s.version     = Heimdall::VERSION
  s.authors     = ["Felipe Aquino"]
  s.email       = ["aquinofb@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Heimdall."
  s.description = "TODO: Description of Heimdall."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.5"
end
