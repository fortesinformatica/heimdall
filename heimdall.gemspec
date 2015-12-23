$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "heimdall/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "heimdall"
  s.version     = Heimdall::VERSION
  s.authors     = ["Equipe NEL"]
  s.email       = ["desenvolvimento.nel@grupofortes.com.br"]
  s.homepage    = ""
  s.summary     = "Summary of Heimdall."
  s.description = "Description of Heimdall."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.5"
end
