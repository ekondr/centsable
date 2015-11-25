lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'centsable/version'

Gem::Specification.new do |spec|
  spec.name          = 'centsable'
  spec.version       = Centsable::VERSION
  spec.authors       = ['Eugene Kondratiuk']
  spec.email         = ['ekondr@gmail.com']
  spec.summary       = 'The gem provides ability to store your price values in cents.'
  spec.description   = 'The gem provides ability to store your price values in cents.'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rails'
  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec-rails'
end
