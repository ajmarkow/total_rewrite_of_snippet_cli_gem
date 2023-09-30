# Shale → Espanso Schema

Generated from Schema as of 9/29

```ruby
# --- params.rb ---
require 'shale'

class Params < Shale::Mapper
  attribute :placeholder, Shale::Type::String
#TO-DO: Add one of logic + options for initial keysub-mappings
  json do
    map 'placeholder', to: :placeholder
  end
end


# --- vars.rb ---
require 'shale'

require_relative 'params'

class Vars < Shale::Mapper
  attribute :name, Shale::Type::String
  attribute :variable_type, Shale::Type::String
  attribute :params, Params

  json do
    map 'name', to: :name
    map 'variable_type', to: :variable_type
    map 'params', to: :params
  end
end


# --- snippet.rb ---
require 'shale'

require_relative 'vars'

class Snippet < Shale::Mapper
  attribute :trigger, Shale::Type::String, collection: true
  attribute :regex, Shale::Type::String
  attribute :label, Shale::Type::String, collection: true
  attribute :word, Shale::Type::Boolean
  attribute :image_path, Shale::Type::String
  attribute :propagate_case, Shale::Type::Boolean
  attribute :replace, Shale::Type::String
  attribute :form, Shale::Type::String
  attribute :vars, Vars, collection: true

  json do
    map 'trigger', to: :trigger
    map 'regex', to: :regex
    map 'label', to: :label
    map 'word', to: :word
    map 'image_path', to: :image_path
    map 'propagate_case', to: :propagate_case
    map 'replace', to: :replace
    map 'form', to: :form
    map 'vars', to: :vars
  end
end
```
