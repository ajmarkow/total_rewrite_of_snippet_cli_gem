require "dry-validation"

class Snippet < Dry::Validation::Contract
  # Setting for dry-validation that makes explicit type definitions required
  # configure { config.type_specs = true }

  module TriggerTypes
    include Dry::Types(default: :strict)
    TypeOptions = String.enum("trigger", "regex")
  end

  module ReplaceTypes
    include Dry::Types(default: :strict)
    TypeOptions = String.enum("form", "replace", "image_path")
  end

  module VarTypes
    include Dry::Types(default: :strict)
    TypeOptions = String.enum("clipboard", "choice", "date", "echo", "form", "random", "script", "shell")
  end

  schema do
    required(:trigger_type).value(TriggerTypes::TypeOptions).filled(:string)
    required(:contents_of_trigger).value(:array, min_size?: 1)
    required(:replace_type).value(ReplaceTypes::TypeOptions).filled(:string)
    required(:contents_of_replace).filled(:string)
    optional(:word).value(:bool?)
    optional(:propagate_case).value(:bool?)
    optional(:vars).hash
  end
=begin
  rule(word_key_absence: [:trigger_type, :word]) do |trigger_type, word|
    trigger_type.value(eql?: "image_path").then(word.none?)
  end

  rule(propagate_case_key_absence: [:trigger_type, :propagate_case]) do |trigger_type, propagate_case|
    trigger_type.value(eql?: "image_path").then(propagate_case.none?)
  end
=end
end
