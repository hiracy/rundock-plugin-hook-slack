# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rundock/plugin/hook/slack/version'

Gem::Specification.new do |spec|
  spec.name          = "rundock-plugin-hook-slack"
  spec.version       = Rundock::Plugin::Hook::Slack::VERSION
  spec.authors       = ["hiracy"]
  spec.email         = ["leizhen@mbr.nifty.com"]

  spec.summary       = %q{rundock plugin for slack API hook}
  spec.homepage      = 'https://github.com/hiracy/rundock-plugin-hook-slack'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rundock'
  spec.add_runtime_dependency     'slack-api'
end
