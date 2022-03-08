require './lib/braille_english_map'

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

  def read_new_file
    File.readlines("./lib/#{@inputs[1]}")
  end

  def characters_within_limit_array
    original_braille_array = read_original_file.map {|row| row.chop}
    nested_braille_array = original_braille_array.map {|row| row.split}
    full_braille_char_array = []
    full_braille_char_array << nested_braille_array[0][0].slice(0..1)
    full_braille_char_array <<  nested_braille_array[1][0].slice(0..1)
    full_braille_char_array << nested_braille_array[2][0].slice(0..1)
  end

  def create_english_letters
    translation = BrailleEnglishMap.new(read_original_file)
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
