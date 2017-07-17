# require modules here
require 'pry'
require 'yaml'

def load_library(filepath)
  file = {'get_meaning' => {}, 'get_emoticon' => {}}
  emo = YAML.load_file(filepath).each do |x,y|
    file['get_emoticon'][y[0]] = y[1]
    file['get_meaning'][y[1]] = x
      end
  file
end

def get_japanese_emoticon(filepath, emoticon)
  load_library(filepath)['get_emoticon'].each do |engemo,japemo|
    if emoticon == engemo
      return japemo
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(filepath, emoticon)
  load_library(filepath)['get_meaning'].each do |japemo,engemo|
    if emoticon == japemo
      return engemo
    end
end
return "Sorry, that emoticon was not found"
end
