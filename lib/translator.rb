require 'yaml'

def load_library(file)
  file_content = YAML.load_file(file)
  list_emoticons = {"get_meaning" => {}, "get_emoticon" => {}}

  file_content.each do |meaning, emoticons|
    list_emoticons["get_meaning"].merge!({emoticons.last => meaning})
    list_emoticons["get_emoticon"].merge!({emoticons.first => emoticons.last})
  end

  list_emoticons
end

def get_japanese_emoticon(file, emoticon)
  library = load_library(file)

  if library["get_emoticon"].key?(emoticon)
    return library["get_emoticon"][emoticon]
  end

  "Sorry, that emoticon was not found"
end

def get_english_meaning(file, emoticon)
  library = load_library(file)

  if library["get_meaning"].key?(emoticon)
    return library["get_meaning"][emoticon]
  end

  "Sorry, that emoticon was not found"
end

# def get_japanese_emoticon(file, emoticon)
#   library = load_library(file)
#   library["get_emoticon"][emoticon] ? library["get_emoticon"][emoticon] : "Sorry, that emoticon was not found"
# end

# def get_english_meaning(file, emoticon)
#   library = load_library(file)
#   library["get_meaning"][emoticon] ? library["get_meaning"][emoticon] : "Sorry, that emoticon was not found"
# end

