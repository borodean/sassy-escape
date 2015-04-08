# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sassy-escape/version"

Gem::Specification.new do |spec|
  spec.name          = "sassy-escape"
  spec.version       = SassyEscape::VERSION
  spec.authors       = ["Vadim Borodean"]
  spec.email         = ["borodean@gmail.com"]

  spec.summary       = "Sass wrapper for a JavaScript library for escaping CSS strings and identifiers"
  spec.homepage      = "http://github.com/borodean/sassy-escape"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "cssesc"
  spec.add_dependency "sass"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "therubyracer"
end
