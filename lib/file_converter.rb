require './lib/english_braille_map'

class FileConverter
  # stores frist file (message.txt) contents to variable
  attr_reader :file

  def initialize(file)
    @file = file
    @inputs = ARGV
  end

  def read_original_file
    File.readlines("./lib/message.txt")
  end

  # create a new file and shuvel the 'file' ^^ variable with message content into the new file
  def create_new_file
    open("./lib/#{@inputs[1]}", 'w'){|new_file|
      new_file << @file}
  end

  def read_new_file
    # open the new brialle file and read each line of the file, storing them as elements in an array
    File.readlines("./lib/#{@inputs[1]}")
  end

  def create_braille_characters
    translation = English_Braille_Map.new(read_original_file)
    translation.find_braille_chars.flatten
  end

  def braille_characater_count
    lines = File.readlines("./lib/#{@inputs[1]}")
    lines = lines.map{|element| element.chomp}
    braille_character_count = lines.join.length
  end

  def characters_within_limit_array
    lines_within_limit = []
    create_braille_characters.each_slice(120) {|line| lines_within_limit << line}
    lines_within_limit
  end

  def update_new_file_to_braille
      new_braille_file = File.open("./lib/#{@inputs[1]}", 'w')
      characters_within_limit_array[0].each_slice(3) {|element|
        new_braille_file.write(element[0])}
        new_braille_file.write("\n")
      characters_within_limit_array[0].drop(1).each_slice(3) {|element|
        new_braille_file.write(element[0])}
        new_braille_file.write("\n")
      characters_within_limit_array[0].drop(2).each_slice(3) {|element|
        new_braille_file.write(element[0])}
        new_braille_file.write("\n")
      if characters_within_limit_array.count > 1
        characters_within_limit_array[1].each_slice(3) {|element|
          new_braille_file.write(element[0])}
          new_braille_file.write("\n")
        characters_within_limit_array[1].drop(1).each_slice(3) {|element|
          new_braille_file.write(element[0])}
          new_braille_file.write("\n")
        characters_within_limit_array[1].drop(2).each_slice(3) {|element|
          new_braille_file.write(element[0])}
          new_braille_file.write("\n")
      end
      new_braille_file.close
  end

  def print_confirmation
    # join the elements in the array into a single array and store in the variable characters
    characters = read_original_file.join
    character_count = characters.length
    p "Created '#{@inputs[1]}' containing #{character_count - 1} characters"
  end
end
