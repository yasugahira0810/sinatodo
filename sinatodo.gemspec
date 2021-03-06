# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sinatodo/version'

Gem::Specification.new do |spec|
  spec.name          = "sinatodo"
  spec.version       = Sinatodo::VERSION
  spec.authors       = ["Yuta Yasugahira"]
  spec.email         = ["hourou_freak@yahoo.co.jp"]

  spec.summary       = %q{Todo: Write a short summary, because Rubygems requires one.}
  spec.description   = %q{Todo: Write a longer description or delete this line.}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "Todo: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord", "= 3.2.22.1"
  spec.add_dependency "sqlite3",      "= 1.3.7"
  spec.add_dependency "sinatra",      "~> 1.4.0"
	spec.add_dependency "haml",      "~> 4.0.0"
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "yard",      "~> 0.9.11"
  spec.add_development_dependency "redcarpet", "~> 2.2"
end
