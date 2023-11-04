require "./lib/snippet_cli/promptGenerator"

# frozen_string_literal: true

RSpec.describe PromptGenerator, :type => :aruba do
  test_instance_of_prompt_generator = PromptGenerator.new("trigger")
  puts test_instance_of_prompt_generator.methods
  puts "--"
  puts test_instance_of_prompt_generator.display
  describe "The prompt generator class" do
    it "Prompts user for a trigger requested prompt type is trigger" do
      expect(test_instance_of_prompt_generator.prompt_type).to eq(select)
    end
  end
end
