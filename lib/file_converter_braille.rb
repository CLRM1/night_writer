class FileConverterBraille

  attr_reader :file

  def initialize(file)
    @file = file
    @inputs = ARGV
  end

  def read_original_file
    File.readlines("./lib/message.txt")
  end

  def create_new_file
    open("./lib/#{@inputs[1]}", 'w'){|new_file|
      new_file << @file}
  end

  def read_new_file
    File.readlines("./lib/#{@inputs[1]}")
  end

  def print_confirmation
    characters = read_original_file.join
    character_count = characters.length
    p "Created '#{@inputs[1]}' containing #{character_count - 1} characters"
  end

end