# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'weather_insight/version'

Gem::Specification.new do |spec|
  spec.name          = "weather_insight"
  spec.version       = WeatherInsight::VERSION
  spec.authors       = ["kozakana"]
  spec.email         = ["goki727@gmail.com"]
  spec.summary       = %q{WeatherInsight acquire average data of past weather from goo.}
  spec.description   = %q{WeatherInsight acquire average data of past weather from goo.}
  spec.homepage      = "https://github.com/kozakana"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_dependency "nokogiri"
end
