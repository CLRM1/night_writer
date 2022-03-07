require './lib/file_converter_braille'

translation = FileConverterBraille.new(File.read("./lib/braille.txt"))
translation.create_new_file
# translation.update_new_file_to_braille
translation.print_confirmation
