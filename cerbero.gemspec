# -*- encoding: utf-8 -*-
require File.expand_path('../lib/cerbero/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Dmitriy Kiriyenko"]
  gem.email         = ["dmitriy.kiriyenko@anahoret.com"]
  gem.description   = %q{Get validation error from database constraint.}
  gem.summary       = %q{Get validation error from database constraint.
                         You can be sure your uniqueness validation guarantees uniqueness.}
  gem.homepage      = ""

  gem.add_dependency "activerecord", ">= 3.0.0"
  gem.add_development_dependency "rspec", ">= 2.0.0"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "database_cleaner"
  gem.add_development_dependency "sqlite3"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "cerbero"
  gem.require_paths = ["lib"]
  gem.version       = Cerbero::VERSION
end
