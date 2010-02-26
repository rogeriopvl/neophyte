require 'rake/clean'
require 'rubygems/specification'

task :default => :package

$spec = eval(File.read('neophyte.gemspec'))

def package(ext='')
  "pkg/neophyte-#{$spec.version}" + ext
end

desc 'Build packages'
task :package => %w[.gem].map {|e| package(e)}

desc 'Build and install as local gem'
task :install => package('.gem') do
  sh "gem install #{package('.gem')}"
end

directory 'builds/'

file package('.gem') => %w[pkg/ neophyte.gemspec] + $spec.files do |f|
  sh "gem build neophyte.gemspec"
  mv File.basename(f.name), f.name
end
