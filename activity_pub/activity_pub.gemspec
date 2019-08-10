# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "activity_pub"
  spec.version       = '0.1'
  spec.authors       = ["Shane Cavanaugh"]
  spec.email         = ["shane@shanecav.net"]

  spec.summary       = 'Model ActivityStreams'
  spec.description   = 'Model ActivityStreams'
  spec.homepage      = 'https://github.com/shanecav84/social/activity_pub'
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = 'https://github.com/shanecav84/social/activity_pub'
    spec.metadata["changelog_uri"] = 'https://github.com/shanecav84/social/activity_pub/tree/master/CHANGELOG.md'
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_path = 'lib'

  spec.required_ruby_version = ">= 1.9.2"

  spec.add_dependency 'pg'
  spec.add_dependency 'roda', '~> 3.0'
  spec.add_dependency 'sequel', '~> 5.0'

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rack-test", "~> 1.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "simplecov", "~> 0.1"
end
