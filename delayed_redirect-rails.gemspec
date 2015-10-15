# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'delayed_redirect/rails/version'

Gem::Specification.new do |spec|
  spec.name          = "delayed_redirect-rails"
  spec.version       = DelayedRedirect::Rails::VERSION
  spec.authors       = ["Nathan Colgate Clark"]
  spec.email         = ["nathancolgate@gmail.com"]
  spec.summary       = "For redirecting to objects (normally PDFs) that require a delayed job processing before we can redirect to them"
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "railties"
  spec.add_dependency "rails-assets-jquery"
  spec.add_dependency "rails-assets-sweetalert"
  spec.add_dependency "delayed_job_active_record"
end
