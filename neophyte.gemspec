require 'neophyte'

Gem::Specification.new do |s|
  s.name = 'neophyte'
  s.version = Neophyte::VERSION
  s.summary = "A lightweight project creator."
  s.date = '2010-02-25'
  s.email = 'rogeriopvl@gmail.com'
  s.homepage = 'http://github.com/rogeriopvl/neophyte'
  s.has_rdoc = false
  s.authors = ["Rogério Vicente"]
  s.files = %w[
    LICENSE
    README.md
    bin/neo
    lib/neophyte.rb
    lib/neophyte/runner.rb
  ]
  s.default_executable = 'neo'
  s.executables        = [ 'neo' ]
end