Gem::Specification.new do |s|
  s.name        = 'sequel-activerecord-hooks'
  s.version     = '0.0.1'
  s.date        = '2014-02-18'
  s.summary     = "ActiveRecord style hooks for Sequel"
  s.description = "Enables support for ActiveRecord style hooks on your Sequel based models"
  s.authors     = ["Noah Blumenthal"]
  s.email       = 'noah@hackerhasid.com'
  s.files       = ["lib/sequel_activerecord_hooks.rb"]
  s.homepage    = 'https://github.com/hackerhasid/sequel-activerecord-hooks'
  s.license     = "MIT"

  s.add_runtime_dependency "sequel"
end