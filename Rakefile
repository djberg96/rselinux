require 'rake'
require 'rake/clean'
require 'rspec/core/rake_task'

CLEAN.include("**/*.gem", "**/*.rbx", "**/*.rbc", "ruby.core", "**/*.lock")

namespace :gem do
  desc "Create the rselinux gem"
  task :create => [:clean] do
    require 'rubygems/package'
    spec = Gem::Specification.load('rselinux.gemspec')
    spec.signing_key = File.join(Dir.home, '.ssh', 'gem-private_key.pem')
    Gem::Package.build(spec)
  end

  desc "Install the rselinux gem"
  task :install => [:create] do
    file = Dir["*.gem"].first
    sh "gem install -l #{file}"
  end
end

desc "Run the test suite"
RSpec::Core::RakeTask.new(:spec) do |t|
  t.verbose = false
  t.rspec_opts = '-f documentation'
end

task :default => :spec
