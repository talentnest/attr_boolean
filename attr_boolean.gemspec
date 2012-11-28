# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'attr_boolean/version'

Gem::Specification.new do |gem|
  gem.name          = "attr_boolean"
  gem.version       = AttrBoolean::VERSION
  gem.authors       = ["Daniel Vandersluis"]
  gem.email         = ["dvandersluis@selfmgmt.com"]
  gem.description   = %q{Shortcut for creating boolean attributes}
  gem.summary       = %q{Shortcut for creating boolean attributes}
  gem.homepage      = "https://www.github.com/talentnest/attr_boolean"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "activesupport", ">= 3.0.0"

  gem.add_development_dependency "rspec"
end
