require './lib/english_braille_map'

class FileConverter
  # stores frist file (message.txt) contents to variable
  attr_reader :file

  def initialize(file)
    @file = file
    @inputs = ARGV
    @new_braille_file = ''
  end

  def read_original_file
    lines = File.readlines("./lib/message.txt")
  end

  # create a new file and shuvel the 'file' ^^ variable with message content into the new file
  def create_new_file
    @new_braille_file = open("./lib/#{@inputs[1]}", 'w') do |new_file|
      new_file << @file
    end
  end

  def read_new_file
    # open the new brialle file and read each line of the file, storing them as elements in an array
    lines = File.readlines("./lib/#{@inputs[1]}")
  end

  def create_braille_characters
    translation = English_Braille_Map.new(read_original_file)
    translation.find_braille_chars.flatten
  end

  def update_new_file_to_braille
    braille_array = create_braille_characters
    @new_braille_file = open("./lib/#{@inputs[1]}", 'w') do |new_file|
      braille_array.each_slice(3) {|element|
                    new_file << element[0] + ' '}
                    new_file <<  "#{$/}"
      braille_array.drop(1).each_slice(3) {|element|
                    new_file << element[0] + ' '}
                    new_file << "#{$/}"
      braille_array.drop(2).each_slice(3) {|element|
                    new_file << element[0] + ' '}
    end
  end

  def print_confirmation
    # join the elements in the array into a single array and store in the variable characters
    characters = read_original_file.join
    character_count = characters.length
    p "Created '#{@inputs[1]}' containing #{character_count - 1} characters"
  end
end

#  What's happening in the update_new_file_to_braille (lines 46 - 56 iterations): iteratate every 3 until the element is nil
  #  add the iterations together and a space inbetween them
   # shuvel the concatenated string into the new file
   #  start over at the next index
      #  repeat first steps
      # new_file << braille_array[0] + " " +  braille_array[3] + " " + braille_array[6] + " " + braille_array[9] + " " + braille_array[12] + " " + braille_array[15] + "#{$/}"
      # new_file << braille_array[1] + " " +  braille_array[4] + " " + braille_array[7] + " " + braille_array[10] + " " + braille_array[13] + " " + braille_array[16] + "#{$/}"
      # new_file << braille_array[2] + " " +  braille_array[5] + " " + braille_array[8] + " " + braille_array[11] + " " + braille_array[14] + " " + braille_array[17] + "#{$/}"
