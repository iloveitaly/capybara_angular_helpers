# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capybara_angular_helpers/version'

Gem::Specification.new do |spec|
  spec.name          = "capybara_angular_helpers"
  spec.version       = CapybaraAngularHelpers::VERSION
  spec.authors       = ["Michael Bianco"]
  spec.email         = ["mike@cliffsidemedia.com"]

  spec.summary       = "Helpers for writing integration tests against Angular apps"
  # spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = "https://github.com/iloveitaly/capybara_angular_helpers"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rspec"
  spec.add_dependency "capybara"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
