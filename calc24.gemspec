# -*- encoding: utf-8 -*-
require File.expand_path("../lib/calc24/version", __FILE__)



Gem::Specification.new do |s|
  s.name        = "24games"
  s.version     = Calc24::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["takafan"]
  s.email       = ["takafan@hululuu.com"]
  s.homepage    = "http://rubygems.org/gems/24games"
  s.summary     = "24 game/Solve"
  s.description = <<-EOF
    解24点。computes an expression to solve the 24 game if possible.
  EOF

  s.required_rubygems_version = ">= 1.3.6"
  s.requirements << 'none'
  s.rubyforge_project         = "24games"

  #s.add_development_dependency "bundler", ">= 1.0.0"

  s.files        = `git ls-files`.split("\n")
  #s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.executables = ['24games']
  s.require_path = 'lib'
end

