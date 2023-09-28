# frozen_string_literal: true

require "./lib/snippet_cli"

RSpec.describe SnippetCli do
  it "should have a version number." do
    expect(SnippetCli::VERSION).not_to be nil
  end

  it "should return the path of config file on mac." do
    path_of_espanso_config = `echo $HOME`.chomp + "/Library/Application Support/espanso/match/base.yml"
    expect(SnippetCli.config_path).to eq(path_of_espanso_config)

    puts " TEST NOTE: In case of this test system, the path to config is  #{path_of_espanso_config}"
  end
end
