$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "active_admin/umeditor/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "activeadmin-umeditor"
  s.version     = Activeadmin::Umeditor::VERSION
  s.authors     = ["ACzero"]
  s.email       = ["lzh.scut@hotmail.com"]
  s.homepage    = "https://github.com/ACzero/activeadmin-umeditor"
  s.summary     = "Integrate umeditor with activeadmin"
  s.description = "Integrate umeditor with activeadmin"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 4.0", "< 5.0"

  s.add_development_dependency "sqlite3"
end
