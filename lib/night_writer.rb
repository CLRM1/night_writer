require './lib/file_converter'

translation = FileConverter.new(File.read("./lib/message.txt"))
translation.create_new_file
translation.update_new_file_to_braille
translation.print_confirmation
