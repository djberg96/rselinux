require 'rubygems'

Gem::Specification.new do |spec|
  spec.name       = 'rselinux'
  spec.version    = '1.0.0'
  spec.author     = 'Daniel Berger'
  spec.email      = 'djberg96@gmail.com'
  spec.license    = 'Apache-2.0'
  spec.summary    = 'A Ruby library for SELinux'
  spec.homepage   = 'https://github.com/djberg96/rselinux'
  spec.files      = Dir['**/*'].reject{ |f| f.include?('git') }
  spec.test_files = Dir['test/test*.rb']
  spec.cert_chain = Dir['certs/*']

  spec.add_development_dependency('rake')
  spec.add_development_dependency('rspec', '~> 3.9')

  spec.metadata = {
    'homepage_uri'      => 'https://github.com/djberg96/rselinux',
    'bug_tracker_uri'   => 'https://github.com/djberg96/rselinux/issues',
    'changelog_uri'     => 'https://github.com/djberg96/rselinux/blob/main/CHANGES.md',
    'documentation_uri' => 'https://github.com/djberg96/rselinux/wiki',
    'source_code_uri'   => 'https://github.com/djberg96/rselinux',
    'wiki_uri'          => 'https://github.com/djberg96/rselinux/wiki'
  }

  spec.platform = Gem::Platform.new(['universal', 'linux'])

  spec.description = <<-EOF
    The rselinux library provides an interface for the libselinux API
    using FFI. Security-Enhanced Linux (SELinux) is a security architecture
    for Linux systems that allows administrators to have more control over
    who can access the system.
  EOF
end
