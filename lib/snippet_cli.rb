# frozen_string_literal: true

require_relative "snippet_cli/version"

module SnippetCli
  class Error < StandardError; end

  def self.config_path
    # Retrieves Espanso config path, appends folder name + main YAML filename to get file path to append snippets to.
    "#{`espanso path config`.chomp}/match/base.yml"
  end

  def export_as_yaml(validated_input)
    obj = YAML.safe_load(validated_input)
    new_obj = {"data-for-output" => obj["snippet"]}
    YAML.dump(new_obj)
  end
end
