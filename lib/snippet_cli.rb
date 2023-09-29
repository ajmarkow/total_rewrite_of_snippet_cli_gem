# frozen_string_literal: true

require_relative "snippet_cli/version"

module SnippetCli
  class Error < StandardError; end

  def self.config_path
    # Retrieves Espanso config path, appends folder name + main YAML filename to get file path to append snippets to.
    `espanso path config`.chomp + "/match/base.yml"
  end

  def 
    obj = YAML.load(input)
    new_obj = {"student" => obj["person"]}
    output = YAML.dump(new_obj)
puts output
end
