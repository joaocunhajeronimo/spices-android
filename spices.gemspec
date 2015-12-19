Gem::Specification.new do |s|
  s.name        = 'spices'
  s.version     = '0.0.0'
  s.date        = '2015-12-28'
  s.summary     = "Software layer between Calabash and Cucumber"
  s.description = "A gem that makes the use of Calabash way simpler and straightforward"
  s.authors     = ["Titouan Van Belle"]
  s.email       = 'titouan.vanbelle@gmail.com'
  s.files       = `git ls-files`.split("\n")
  s.require_paths = ["lib"]
  s.homepage    = 'http://rubygems.org/gems/spices'
  s.license     = 'MIT'
  s.add_dependency("calabash-cucumber")
  s.add_dependency('calabash-cucumber', '< 1.7.0')
end
