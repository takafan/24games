# -*- encoding: utf-8 -*-
require File.expand_path("../lib/calc24/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = %q{24games}
  s.version     = Calc24::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["takafan"]
  s.email       = %q{takafan@hululuu.com}
  s.homepage    = %q{http://github.com/takafan/24games"}
  s.summary     = %q{24 game/Solve}
  s.description = %q{
    解24点。computes an expression to solve the 24 game if possible.
  }

  s.required_rubygems_version = %q{>= 1.3.6}
  s.rubyforge_project         = %q{24games}

  s.files        = `git ls-files`.split("\n")
  s.executables  = ["24games"]
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_path = %q{lib}
end
