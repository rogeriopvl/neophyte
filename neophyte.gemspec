require 'lib/neophyte'

Gem::Specification.new do |s|
  s.name = 'neophyte'
  s.version = Neophyte::VERSION
  s.summary = "A lightweight project creator."
  s.date = '2010-02-25'
  s.authors = 'Rogério Vicente'
  s.email = 'rogeriopvl@gmail.com'
  s.homepage = 'http://github.com/rogeriopvl/neophyte'
  s.has_rdoc = false
  s.files = %w[
    LICENSE
    README.md
    bin/neo
    lib/neophyte.rb
    lib/neophyte/runner.rb
  ]
  s.default_executable = 'neo'
  s.executables        = [ 'neo' ]
  s.post_install_message = %q{------------------------------------------------------------------------------
  Thank you for installing Neophyte. You can start using it by typing in a
  terminal window the following command:
  
      neo myproject_name
  
  There are more options available. You can find more info by typing:
  
      neo help
  
  You can send feedback to < rogeriopvl@gmail.com >. Have fun!
------------------------------------------------------------------------------
  }
end