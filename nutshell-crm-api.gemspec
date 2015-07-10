# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "nutshell-crm-api/version"

Gem::Specification.new do |s|
  s.name        = "nutshell-crm-api"
  s.version     = NutshellCrm::VERSION
  s.authors     = ["Christian Juth"]
  s.email       = ["cjuth2@gmail.com"]
  s.homepage    = "https://github.com/Christianjuth/nutshell-crm-api"
  s.summary     = "A Ruby wrapper for Nutshell CRM's API"
  s.description = "Nutshell CRM's API"
  s.license     = "MIT"

  s.add_development_dependency 'rake'
  s.add_development_dependency 'yard'
  s.add_development_dependency 'rspec'

  s.add_runtime_dependency 'json'
  s.add_runtime_dependency 'httparty'


  s.rubyforge_project = "nutshell-crm-api"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
