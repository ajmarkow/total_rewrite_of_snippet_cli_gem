require "tty-prompt"

class PromptGenerator
  PROMPT = TTY::Prompt.new
  attr_accessor :prompt_type
  def initialize(type)
    @@requested_prompt_type = type
  end

  def prompt_for_input
    case requested_prompt_type
    when trigger
      trigger_types = %w[regex trigger triggers]
      prompt.enum_select("What type of trigger would you like to type to trigger your text replacement?", trigger_types)
    end
  end
end
