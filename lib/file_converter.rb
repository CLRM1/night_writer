class FileConverter
  #stores file contents to variable
  #get input from command line from ARGV and store in variable
  def initialize(file)
    @file = file
    @new_file_name = ARGV
    @new_braille_file = ''
  end
  # create a new file and shuvel the 'file' ^^ variable with message content into the new file
  def create_new_file
    @new_braille_file = open("#{@new_file_name[1]}", 'w') do |new_file|
      new_file << @file
    end
  end

  def upddate_newfile
    # open the new brialle file and read each line of the file, storing them as elements in an array
    lines = File.readlines('braille.txt')
    # join the elements in the array into a single array and store in the variable characters
    characters = lines.join
    # use the length method to count the number of characters in the array
    # why is is this 1 character too high?
    character_count = characters.length
    puts "Created '#{@new_file_name.first}' containing #{character_count - 1} characters"
  end

end
# 
# translation = FileConverter.new(File.read("message.txt"))
# translation.create_new_file
# translation.upddate_newfile
