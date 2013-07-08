# -*- encoding: utf-8 -*-
require File.expand_path('../lib/SVDPlusPlus/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Yuurga"]
  gem.email         = ["yuurga@gmail.com"]
  gem.description   = "SVD++ machine learning alogorithm for collaborative filtering recomendation systems"
  gem.summary       = "SVD++ collaborative filtering"
  gem.homepage      = "https://github.com/Yuurga/SVDPlusPlus/tree/master/SVDPlusPlus"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "SVDPlusPlus"
  gem.require_paths = ["lib"]
  gem.version       = SVDPlusPlus::VERSION
end
