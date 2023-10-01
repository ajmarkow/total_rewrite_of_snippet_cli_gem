require "dry-validation"

class Snippet < Dry::Validation::Contract
  # Setting for dry-validation that makes explicit type definitions required

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
    ExtensionTypes = String.enum("clipboard", "choice", "date", "echo", "form", "random", "script", "shell")
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

  rule(:word, :replace_type) do
    if key?(:replace_type) && key?(:word) && replace_type.eql?(value("image_path"))
      base.failure("I'm sorry, but the word boolean setting cannot be applied to an image snippet.")
    end
  end

  rule(:trigger_type, :contents_of_trigger) do |trigger_type, contents_of_trigger|
    key.failure("I'm sorry, but a regex snippet can only have one trigger.") if values[:trigger_type] == 'regex'
  end

  rule(:propagate_case, :replace_type) do
    if key?(:replace_type) && key?(:word) && replace_type.eql?(value("image_path"))
      base.failure("I'm sorry, but the propagate_case boolean setting cannot be applied to an image snippet.")
    end
  end
end
