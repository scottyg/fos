# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fos/version'

Gem::Specification.new do |spec|
  spec.name          = "fos"
  spec.version       = Fos::VERSION
  spec.authors       = ["Scott Gordon"]
  spec.email         = ["me@scottyg.net"]
  spec.summary       = %q{A File Archiver}
  spec.description   = %q{A File Archiver}
  spec.homepage      = "http://www.iamscottyg.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ["fos"]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
