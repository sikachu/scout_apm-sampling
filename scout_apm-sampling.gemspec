require_relative "lib/scout_apm/sampling/version"

Gem::Specification.new do |spec|
  spec.name          = "scout_apm-sampling"
  spec.version       = ScoutApm::Sampling::VERSION
  spec.authors       = ["Prem Sichanugrist"]
  spec.email         = ["s@sikac.hu"]

  spec.summary       = "Providing an out-of-the-box sampling feature to scout_apm gem"
  spec.homepage      = "https://github.com/sikachu/scout_apm-sampling"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "actionpack", ">= 6.0"
  spec.add_dependency "activejob", ">= 6.0"

  spec.add_development_dependency "rake", "~> 13.0"
end
