Gem::Specification.new do |s|
  s.name        = 'spices-android'
  s.version     = '0.0.0'
  s.executables << 'spices'
  s.date        = '2015-12-28'
  s.summary     = "Component object framework for Calabash"
  s.description = "A gem that makes the use of Calabash way simpler and straightforward"
  s.authors     = ["Titouan Van Belle"]
  s.email       = 'titouan.vanbelle@gmail.com'
  s.files       = `git ls-files`.split("\n")
  s.require_paths = ["lib"]
  s.homepage    = 'http://rubygems.org/gems/spices-android'
  s.license     = 'MIT'
  s.add_dependency 'calabash-android', ['>= 0.5', '< 0.6']
  s.add_dependency 'byebug'
end
