# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'enotas/version'

Gem::Specification.new do |spec|
  spec.name          = "enotas"
  spec.version       = Enotas::VERSION
  spec.authors       = ["Ricardo Caldeira"]
  spec.email         = ["ricardo.nezz@gmail.com"]

  spec.summary       = %q{Enotas ruby gem}
  spec.description   = %q{Enotas ruby gem}
  spec.homepage      = "https://www.pluga.co"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rest-client", "~> 1.8.0"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
