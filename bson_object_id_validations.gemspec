# -*- encoding: utf-8 -*-
require File.expand_path('../lib/bson_object_id_validations/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Nick Hoffman"]
  gem.email         = ["nick@deadorange.com"]
  gem.description   = %q{Provides an ActiveModel validation that checks if an attribute represents a legal BSON::ObjectId .}
  gem.summary       = %q{Provides an ActiveModel validation that checks if an attribute represents a legal BSON::ObjectId .}
  gem.homepage      = "https://github.com/nickhoffman/bson_object_id_validations"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "bson_object_id_validations"
  gem.require_paths = ["lib"]
  gem.version       = BsonObjectIdValidations::VERSION

  gem.add_runtime_dependency 'activemodel', '>= 3.0'
  gem.add_runtime_dependency 'bson_ext',    '>= 1.6'

  gem.add_development_dependency 'rspec', '>= 2.8'
  gem.add_development_dependency 'rake',  '>= 0.9.0'
end
