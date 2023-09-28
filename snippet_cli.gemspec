# frozen_string_literal: true

require_relative "lib/snippet_cli/version"

Gem::Specification.new do |spec|
  spec.name = "snippet_cli"
  spec.version = SnippetCli::VERSION
  spec.authors = ["AJ Markow"]
  spec.email = ["alexanderjmarkow@gmail.com"]

  spec.summary = "A gem that writes valid yaml mappings to use in your Espanso config"
  spec.description = "A program to write config for https://espanso.org in a consistent fashion"
  spec.homepage = "https://l.ajm.codes/snippet_cli"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ajmarkow/2023_total_rewrite_of_snippets"
  spec.metadata["changelog_uri"] = "https://l.ajm.codes/snippet_cli_changelog"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "json-schema"
  spec.add_dependency "tty-prompt"
  spec.add_dependency "tty-platform"
  spec.add_dependency "thor"
  spec.add_dependency "colorize"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
