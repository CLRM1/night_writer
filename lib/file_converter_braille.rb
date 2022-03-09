require './lib/braille_to_english_dictionary'

class FileConverterBraille

  attr_reader :file

  def initialize(file)
    @file = file
    @inputs = ARGV
  end

  def read_original_file
    File.readlines("./lib/braille.txt")
  end

  def create_new_file
    open("./lib/#{@inputs[1]}", 'w'){|new_file|
      new_file << @file}
  end

  def create_english_letters
    translation = Braille_to_english_dictionary.new(read_original_file)
    translation.find_english_letter

  end

  def update_new_file_to_english
    new_english_file = File.open("./lib/#{@inputs[1]}", 'w')
    english_letters = create_english_letters.join
    new_english_file.write(english_letters)
  end

  def print_confirmation
    characters = read_original_file.join
    character_count = characters.length
    p "Created '#{@inputs[1]}' containing #{character_count - 1} characters"
  end
end
