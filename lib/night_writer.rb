require './lib/file_converter'

translation = FileConverter.new(File.read("./lib/message.txt"))
translation.create_new_file
translation.read_new_file
