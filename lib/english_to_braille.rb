
#stores file contents to variable
file = File.read("message.txt")
# get input from command line from ARGV and store in variable
new_file_name = ARGV
# create a new file and shuvel the 'file' ^^ variable with message content into the new file
new_braille_file = open("#{new_file_name.first}", 'w') do |new_file|
  # require 'pry'; binding.pry
  new_file << file
end
# require 'pry'; binding.pry
#open the new brialle file and read each line of the file, storing them as elements in an array
lines = File.readlines('braille.txt')
# join the elements in the array into a single array and store in the variable characters
characters = lines.join
# use the length method to count the number of characters in the array
# why is is this 1 character too high?
character_count = characters.length
puts "Created '#{new_file_name.first}' containing #{character_count - 1} characters"
