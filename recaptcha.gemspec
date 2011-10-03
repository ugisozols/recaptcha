# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "recaptcha/version"

Gem::Specification.new do |s|
  s.name        = "recaptcha"
  s.version     = Recaptcha::VERSION
  s.authors     = ["Uģis Ozols"]
  s.email       = ["ugis.ozolss@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Simple recaptcha plugin}
  s.description = %q{Simple recaptcha plugin which allows to add reCAPTCHA validations to your forms}

  s.rubyforge_project = "recaptcha"

  s.add_dependency "rails", "~> 3.1.0"
  s.add_development_dependency "rspec", "~> 2.6"

  s.files         = `git ls-files`.split("\n")
  # s.test_files    = `git ls-files -- {spec}/*`.split("\n")
  s.require_paths = ["lib"]
end
