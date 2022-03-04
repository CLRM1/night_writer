class FileConverter
  #stores file contents to variable
  #get input from command line from ARGV and store in variable
  attr_reader :file, :new_braille_file
  def initialize(file)
    @file = file
    @inputs = ARGV
    @new_braille_file = ''
  end
  # create a new file and shuvel the 'file' ^^ variable with message content into the new file
  def create_new_file
    # require 'pry'; binding.pry
    @new_braille_file = open("./lib/#{@inputs[1]}", 'w') do |new_file|
      # require 'pry'; binding.pry
      new_file << @file
    end
    # require 'pry'; binding.pry
  end

  def read_new_file
    # open the new brialle file and read each line of the file, storing them as elements in an array
    lines = File.readlines("./lib/#{@inputs[1]}")
    # join the elements in the array into a single array and store in the variable characters
    characters = lines.join
    # use the length method to count the number of characters in the array
    # why is is this 1 character too high?
    character_count = characters.length
    puts "Created '#{@inputs[1]}' containing #{character_count - 1} characters"
  end

end
