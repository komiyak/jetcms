# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jetcms/version'

Gem::Specification.new do |spec|
  spec.name          = "jetcms"
  spec.version       = Jetcms::VERSION
  spec.authors       = ["Kosuke Komiya"]
  spec.email         = ["komiya@isoftware.jp"]
  spec.description   = %q{Static HTML generator}
  spec.summary       = %q{Static HTML generator}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.executables   = ["jetcms"]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  
  spec.add_dependency "rdiscount", ">= 2.0.0"
  spec.add_dependency "sass", ">= 3.0.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  
  # = MANIFEST =
  spec.files = %w[
    bin/jetcms
    Gemfile
    Gemfile.lock
    jetcms.gemspec
    lib/jetcms/command.rb
    lib/jetcms/sass.rb
    lib/jetcms/version.rb
    lib/jetcms.rb
    lib/template/example.md
    lib/template/article.html.erb
    lib/template/s3.yml.sample
    LICENSE.txt
    Rakefile
    README.md
  ]
  # = MANIFEST =
end
