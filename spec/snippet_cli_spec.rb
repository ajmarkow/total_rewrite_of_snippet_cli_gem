# frozen_string_literal: true

require "./lib/snippet_cli"

RSpec.describe SnippetCli do
  it "Should have a version number." do
    expect(SnippetCli::VERSION).not_to be nil
        puts "↳ TEST NOTE: As of 9/28/23, 0.1.0"

  end

  it "Should return the path of config file on mac." do
    path_of_espanso_config = `echo $HOME`.chomp + "/Library/Application Support/espanso/match/base.yml"
    expect(SnippetCli.config_path).to eq(path_of_espanso_config)

    puts "↳ TEST NOTE: In case of this MacOS test system, the path to config is  #{path_of_espanso_config}"
  end
end
