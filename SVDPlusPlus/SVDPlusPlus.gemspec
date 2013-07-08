# -*- encoding: utf-8 -*-
require File.expand_path('../lib/SVDPlusPlus/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Yuurga"]
  gem.email         = ["yuurga@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "SVDPlusPlus"
  gem.require_paths = ["lib"]
  gem.version       = SVDPlusPlus::VERSION
end
