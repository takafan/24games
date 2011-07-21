# -*- encoding: utf-8 -*-

$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require 'calc24/version'

Gem::Specification.new do |s|
  s.name        = %q{24games}
  s.version     = Calc24::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["takafan"]
  s.email       = %q{takafan@hululuu.com}
  s.homepage    = %q{http://github.com/takafan/24games"}
  s.summary     = %q{24 game/Solve}
  s.description = %q{
    computes an expression to solve the 24 game if possible.
  }

  s.required_rubygems_version = %q{>= 1.3.6}
  s.rubyforge_project         = %q{24games}

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_path = %q{lib}
end
