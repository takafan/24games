# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'calc24/version'

Gem::Specification.new do |s|
  s.name        = "24games"
  s.version     = Calc24::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["takafan"]
  s.email       = ["takafan@163.com"]
  s.homepage    = "http://github.com/takafan/24games"
  s.summary     = %q{24 game/Solve}
  s.description = %q{computes an expression to solve the 24 game if possible.}

  s.rubyforge_project = "24games"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
