require './lib/file_converter_english'

translation = FileConverterEnglish.new(File.read("./lib/message.txt"))
translation.create_new_file
translation.update_new_file_to_braille
translation.print_confirmation
