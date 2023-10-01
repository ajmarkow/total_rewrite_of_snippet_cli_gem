# frozen_string_literal: true

require "./lib/snippet_cli/snippet"
require "dry-validation-matchers"

module TriggerTypes
  include Dry::Types(default: :strict)
  TypeOptions = String.enum("trigger", "regex")
end

module ReplaceTypes
  include Dry::Types(default: :strict)
  TypeOptions = String.enum("form", "replace", "image_path")
end

RSpec.describe "↳ TEST NOTE: Should integrate with dry-validation library to validate schema", type: %i[dry_validation] do
  subject(:schema_class) do
    Class.new(Dry::Validation::Contract) do
      register_macro(:word) do
        if key?(:replace_type) && key?(:word) && replace_type.eql?(value("image_path"))
          base.failure("I'm sorry, but the word boolean setting cannot be applied to an image snippet.")
        end
      end

      register_macro(:propagate_case) do
        if key?(:replace_type) && key?(:word) && replace_type.eql?(value("image_path"))
          base.failure("I'm sorry, but the propagate_case boolean setting cannot be applied to an image snippet.")
        end
      end

      params do
        required(:trigger_type).value(TriggerTypes::TypeOptions).filled(:string)
        required(:contents_of_trigger).value(:array, min_size?: 1)
        required(:replace_type).value(ReplaceTypes::TypeOptions).filled(:string)
        required(:contents_of_replace).filled(:string)
        optional(:word).value(:bool?)
        optional(:propagate_case).value(:bool?)
        optional(:vars).hash
      end

      rule(:word).validate(:word)
      rule(:propagate_case).validate(:propagate_case)
    end
  end

  it { is_expected.to validate(:trigger_type, :required) }
  it { is_expected.to validate(:contents_of_trigger, :required) }
  it { is_expected.to validate(:replace_type, :required) }
  it { is_expected.to validate(:contents_of_replace, :required) }
  it { is_expected.to validate(:word, :optional) }
  it { is_expected.to validate(:propagate_case, :optional) }
  it { is_expected.to validate(:vars, :optional) }
  it { is_expected.to validate(:word, :optional).macro_use?(:word) }
  it { is_expected.to validate(:propagate_case, :optional).macro_use?(:propagate_case) }
end