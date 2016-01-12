# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'git/gsub/files/version'

Gem::Specification.new do |spec|
  spec.name          = 'git-gsub-files'
  spec.version       = Git::Gsub::Files::VERSION
  spec.authors       = ['k1LoW']
  spec.email         = ['k1lowxb@gmail.com']

  spec.summary       = 'A Git subcommand to `mv` file like gsub in a repository'
  spec.description   = 'A Git subcommand to `mv` file like gsub in a repository'
  spec.homepage      = 'https://github.com/k1LoW/git-gsub-files'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'octorelease'
  spec.add_development_dependency 'pry'
end
