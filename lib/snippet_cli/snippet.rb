require "shale/schema"

class Snippet
  def self.json_schema_to_shale
    espanso_schema_json = File.open("espanso-schema-json/espanso-schema.json")
    extracted_json = espanso_schema_json.read
    schema = JSON.parse(extracted_json)

    puts Shale::Schema.from_json(
      [schema],
      root_name: "matches",
      namespace_mapping: {
        nil => "Api::Snippet", # default schema (without ID)
        "http://bar.com" => "Api::Bar"
      }
    )
  end
end
