# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "apn_on_rails/version"

Gem::Specification.new do |s|
  s.name          = %q{apn_on_rails}
  s.version       = ApnOnRails::VERSION
  s.authors       = ["markbates", "Rebecca Nesson"]
  s.email         = %q{tech-team@prx.org}
  s.homepage      = %q{http://github.com/PRX/apn_on_rails}
  s.summary       = %q{Apple Push Notifications on Rails}
  s.description   = %q{APN on Rails is a Ruby on Rails gem that allows you to
  easily add Apple Push Notification (iPhone) support to your Rails application.
  }

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency('configatron')
  s.add_runtime_dependency('activerecord')
  s.add_runtime_dependency('actionpack')

  s.add_development_dependency('rake')
  s.add_development_dependency('autotest')
  s.add_development_dependency('sqlite3')
  s.add_development_dependency('rspec')
  s.add_development_dependency('bundler')
  s.add_development_dependency('rcov')
end

