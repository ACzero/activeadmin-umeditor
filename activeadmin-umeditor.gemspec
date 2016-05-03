$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "activeadmin/umeditor/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "activeadmin-umeditor"
  s.version     = Activeadmin::Umeditor::VERSION
  s.authors     = ["ACzero"]
  s.email       = ["lzh.scut@hotmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Activeadmin::Umeditor."
  s.description = "TODO: Description of Activeadmin::Umeditor."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 5.0.0.beta3", "< 5.1"

  s.add_development_dependency "sqlite3"
end
