# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fake_tag/version'
require 'open-uri'
require 'nokogiri'
require 'rest-client'
require 'json'

Gem::Specification.new do |spec|
  spec.name          = "fake_tag"
  spec.version       = FakeTag::VERSION
  spec.authors       = ["Ed Mckain"]
  spec.email         = ["mckain.default@gmail.com"]
  spec.summary       = %q{Generates fake tags.}
  spec.description   = %q{Provides fake tags for testing purposes.}
  spec.homepage      = "https://github.com/mcka1n/fake_tag"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "nokogiri"
end
