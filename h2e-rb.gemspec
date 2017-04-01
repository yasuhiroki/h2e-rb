# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'h2e/version'

Gem::Specification.new do |spec|
  spec.name          = "h2e-rb"
  spec.version       = H2E::VERSION
  spec.authors       = ["yasuhiroki"]
  spec.email         = ["yasuhiroki.duck@gmail.com"]

  spec.summary       = %q{Convert HTML to ENML(Evernote Markup Language)}
  spec.description   = %q{Convert HTML to ENML(Evernote Markup Language)}
  spec.homepage      = "https://github.com/yasuhiroki/h2e-rb"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "oga", "~> 2.9"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
