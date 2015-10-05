# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'normalize_numbers/version'

Gem::Specification.new do |spec|
  spec.name          = 'normalize_numbers'
  spec.version       = NormalizeNumbers::VERSION
  spec.authors       = ['Vladimir Dralo']
  spec.email         = ['vladimir@dralo.me']

  spec.summary       = 'Allow use of comma for Rails model attributes without loosing decimal part'
  spec.description   = 'Allow use of comma for Rails model attributes without loosing decimal part'
  spec.homepage      = 'https://github.com/vladra/normalize_numbers'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'pry'

  spec.add_dependency 'rails', '>= 4.0'
end
