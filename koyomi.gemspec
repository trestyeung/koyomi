# -*- encoding: utf-8 -*-

$:.push File.expand_path('../lib', __FILE__)
require 'koyomi/version'

Gem::Specification.new do |s|
  s.name        = 'koyomi'
  s.version     = Koyomi::VERSION
  s.authors     = ['OZAWA Sakuro']
  s.email       = ['sakuro@2238club.org']
  s.homepage    = ''
  s.summary     = %q{An Date class extension for East Asian calendar system}
  s.description = <<-EOF.gsub(/^    /, '')
    Koyomi adds some features of East Asian calendar system related to
    the Yin Yang(陰陽) and the Wu Xing(五行) to the Date class.
    EOF

  s.rubyforge_project = ''

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']
end
