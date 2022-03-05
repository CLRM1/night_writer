class FileConverter
  # stores frist file (message.txt) contents to variable
  attr_reader :file

  def initialize(file)
    @file = file
    @inputs = ARGV
    @new_braille_file = ''
  end

  # create a new file and shuvel the 'file' ^^ variable with message content into the new file
  def create_new_file
    @new_braille_file = open("./lib/#{@inputs[1]}", 'w') do |new_file|
      new_file << @file
    end
  end

  def read_new_file
    # open the new brialle file and read each line of the file, storing them as elements in an array
    File.readlines("./lib/#{@inputs[1]}")
  end

  def print_confirmation
    lines = read_new_file
    # join the elements in the array into a single array and store in the variable characters
    characters = lines.join
    character_count = characters.length
    p "Created '#{@inputs[1]}' containing #{character_count - 1} characters"
  end
end
