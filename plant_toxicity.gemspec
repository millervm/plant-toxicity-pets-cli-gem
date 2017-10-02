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

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "nokogiri"
  spec.add_development_dependency "pry"
end
