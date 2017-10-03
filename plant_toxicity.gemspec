# coding: utf-8
require_relative 'lib/plant_toxicity'

Gem::Specification.new do |spec|
  spec.name          = "plant_toxicity"
  spec.version       = PlantToxicity::VERSION
  spec.authors       = ["'Veronica Miller'"]
  spec.email         = ["'vmcmiller@gmail.com'"]
  spec.summary       = "Provides details about common plants and their toxicity to pets."
  spec.description   = "As prompted by the user, it can list all plants starting with a given letter of the alphabet as well as provide further details about any plant listed."
  spec.homepage      = "http://rubygems.org/gems/plant-toxicity"
  spec.license       = "MIT"

  spec.files         = ["lib/plant_toxicity/cli.rb", "lib/plant_toxicity/list.rb", "lib/plant_toxicity/plant.rb", "lib/plant_toxicity/scraper.rb", "lib/plant_toxicity.rb", "bin/plant-toxicity", "README.md", "LICENSE.txt"]

  spec.executables   = ["plant-toxicity"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "nokogiri"
  spec.add_development_dependency "pry"
end
