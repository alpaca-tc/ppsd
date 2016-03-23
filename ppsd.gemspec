# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ppsd/version'

Gem::Specification.new do |spec|
  spec.name          = 'ppsd'
  spec.version       = PPSD::VERSION
  spec.authors       = ['alpaca-tc']
  spec.email         = ['alpaca-tc@alpaca.tc']

  spec.summary       = %q{TODO: Write a short summary, because Rubygems requires one.}
  spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = 'https://github.com/pixiv/ppsd'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec)/}) }
  spec.require_paths = ['lib']
  spec.extensions    = ['ext/ppsd/extconf.rb']

  spec.add_runtime_dependency 'chunky_png'
  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rake-compiler'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'guard-rake'
end
