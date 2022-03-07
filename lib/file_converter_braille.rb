class FileConverterBraille

  attr_reader :file

  def initialize(file)
    @file = file
    @inputs = ARGV
  end

  def read_original_file
    File.readlines("./lib/message.txt")
    # require 'pry'; binding.pry
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

  def print_confirmation
    # join the elements in the array into a single array and store in the variable characters
    characters = read_original_file.join
    character_count = characters.length
    p "Created '#{@inputs[1]}' containing #{character_count - 1} characters"
  end
  
end
