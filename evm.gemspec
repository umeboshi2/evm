Gem::Specification.new do |s|
  s.name        = 'evm'
  s.version     = '0.8.0'
  s.summary     = 'Emacs Version Manager'
  s.description = 'EVM is a command-line tool that allows you to install multiple Emacs versions.'
  s.authors     = ['Johan Andersson']
  s.email       = 'johan.rejeep@gmail.com'
  s.files       = Dir.glob('{lib,spec}/**/*') + %w(README.md)
  s.homepage    = 'http://github.com/rejeep/evm'
  s.license     = 'MIT'
end
