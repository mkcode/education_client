# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'education_stats/version'

Gem::Specification.new do |spec|
  spec.name          = "education_stats"
  spec.version       = EducationStats::VERSION
  spec.authors       = ["Chris Ewald"]
  spec.email         = ["chrisewald@gmail.com"]

  spec.summary       = "Statsd stats to multiple endpoints."
  spec.description   = "Statsd stats to multiple endpoints."
  spec.homepage      = "https://github.com/mkcode/education_stats"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'statsd-ruby'

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "spirit_hands"
end
