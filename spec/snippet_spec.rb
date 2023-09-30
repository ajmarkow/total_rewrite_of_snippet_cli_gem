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
      params do
        required(:trigger_type).value(TriggerTypes::TypeOptions).filled(:string)
        required(:contents_of_trigger).value(:array, min_size?: 1)
        required(:replace_type).value(ReplaceTypes::TypeOptions).filled(:string)
        required(:contents_of_replace).filled(:string)
        optional(:word).value(:bool?)
        optional(:propagate_case).value(:bool?)
        optional(:vars).hash
      end
    end
  end

  it { is_expected.to validate(:trigger_type, :required) }
  it { is_expected.to validate(:contents_of_trigger, :required) }
  it { is_expected.to validate(:replace_type, :required) }
  it { is_expected.to validate(:contents_of_replace, :required) }
  it { is_expected.to validate(:word, :optional) }
  it { is_expected.to validate(:propagate_case, :optional) }
  it { is_expected.to validate(:vars, :optional) }
end
