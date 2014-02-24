# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'voice_com/version'

Gem::Specification.new do |spec|
  spec.name          = "voice_com"
  spec.version       = VoiceCom::VERSION
  spec.authors       = ["Toma"]
  spec.email         = ["t0ma.popov.90@gmail.com"]
  spec.description   = %q{API for sending sms-s}
  spec.summary       = %q{Simple API for working with the VoiceCom sms sending service}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
