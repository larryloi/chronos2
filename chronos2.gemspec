
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "chronos2/version"

Gem::Specification.new do |spec|
  spec.name          = "chronos2"
  spec.version       = Chronos2::VERSION
  spec.authors       = ["Chi Man Lei"]
  spec.email         = ["rubyist.chi@gmail.com"]

  spec.summary       = %q{Chronos2 manages data archive process.}
  spec.description   = %q{Chronos2 provides a simple but effective way to manage data archive process.}
  spec.homepage      = ""
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "ulid", ">= 1.0.0"
  spec.add_runtime_dependency "citrine", ">= 0.1.0"
  
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
