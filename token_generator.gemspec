$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "token_generator/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "token_generator"
  s.version     = TokenGenerator::VERSION
  s.authors     = ["Unai Trecet"]
  s.email       = ["unai13t@gmail.com"]
  s.homepage    = "https://github.com/unai-trecet"
  s.summary     = "token_generator ables you to create unique tokens."
  s.description = "token_generator provides the ability to generate configurable, in terms of format and size, unique tokens."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.4"

  s.add_development_dependency "sqlite3"
  s.add_dependency "byebug"

end
