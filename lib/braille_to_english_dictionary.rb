class Braille_to_english_dictionary

  attr_reader :braille_key_map

  def initialize(characters)
    @braille_key_map = {}
    @characters = characters
  end

  def letters_a_through_g
    @braille_key_map[['0.','..','..']] = 'a'
    @braille_key_map[['0.','0.','..']] = 'b'
    @braille_key_map[['00','..','..']] = 'c'
    @braille_key_map[['00','.0','..']] = 'd'
    @braille_key_map[['0.','.0','..']] = 'e'
    @braille_key_map[['00','0.','..']] = 'f'
    @braille_key_map[['00','00','..']] = 'g'
  end

  def letters_h_through_n
    @braille_key_map[['0.','00','..']] = 'h'
    @braille_key_map[['.0','0.','..']] = 'i'
    @braille_key_map[['.0','00','..']] = 'j'
    @braille_key_map[['0.','..','0.']] = 'k'
    @braille_key_map[['0.','0.','0.']] = 'l'
    @braille_key_map[['00','..','0.']] = 'm'
    @braille_key_map[['00','.0','0.']] = 'n'
  end

  def letters_o_through_u
    @braille_key_map[['0.','.0','0.']] = 'o'
    @braille_key_map[['00','0.','0.']] = 'p'
    @braille_key_map[['00','00','0.']] = 'q'
    @braille_key_map[['0.','00','0.']] = 'r'
    @braille_key_map[['.0','0.','0.']] = 's'
    @braille_key_map[['.0','00','0.']] = 't'
    @braille_key_map[['0.','..','00']] = 'u'
  end

  def letters_v_through_z_and_space
    @braille_key_map[['0.','0.','00']] = 'v'
    @braille_key_map[['.0','00','.0']] = 'w'
    @braille_key_map[['00','..','00']] = 'x'
    @braille_key_map[['00','.0','00']] = 'y'
    @braille_key_map[['0.','.0','00']] = 'z'
    @braille_key_map[['..','..','..']] = " "
  end

  def all_letters
    letters_a_through_g
    letters_h_through_n
    letters_o_through_u
    letters_v_through_z_and_space
  end

  def braille_parser
    read_original_file = File.readlines("./lib/braille.txt")
    original_braille_array = read_original_file.map {|row| row.chop}
    nested_braille_array = original_braille_array.map {|row| row.split}
    number_of_rows = nested_braille_array.count
    full_braille_char_array = Array.new(number_of_rows) {Array.new(0,'')}
    full_braille_char_array = [[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]]

    full_braille_char_array[0] << nested_braille_array[0][0].slice(0..1)
    full_braille_char_array[0] << nested_braille_array[1][0].slice(0..1)
    full_braille_char_array[0] << nested_braille_array[2][0].slice(0..1)

    full_braille_char_array[1] << nested_braille_array[0][0].slice(2..3)
    full_braille_char_array[1] << nested_braille_array[1][0].slice(2..3)
    full_braille_char_array[1] << nested_braille_array[2][0].slice(2..3)

    full_braille_char_array[2] << nested_braille_array[0][0].slice(4..5)
    full_braille_char_array[2] << nested_braille_array[1][0].slice(4..5)
    full_braille_char_array[2] << nested_braille_array[2][0].slice(4..5)

    full_braille_char_array[3] << nested_braille_array[0][0].slice(6..7)
    full_braille_char_array[3] << nested_braille_array[1][0].slice(6..7)
    full_braille_char_array[3] << nested_braille_array[2][0].slice(6..7)

    full_braille_char_array[4] << nested_braille_array[0][0].slice(8..9)
    full_braille_char_array[4] << nested_braille_array[1][0].slice(8..9)
    full_braille_char_array[4] << nested_braille_array[2][0].slice(8..9)

    full_braille_char_array[5] << nested_braille_array[0][0].slice(10..11)
    full_braille_char_array[5] << nested_braille_array[1][0].slice(10..11)
    full_braille_char_array[5] << nested_braille_array[2][0].slice(10..11)

    full_braille_char_array[6] << nested_braille_array[0][0].slice(12..13)
    full_braille_char_array[6] << nested_braille_array[1][0].slice(12..13)
    full_braille_char_array[6] << nested_braille_array[2][0].slice(12..13)

    full_braille_char_array[7] << nested_braille_array[0][0].slice(14..15)
    full_braille_char_array[7] << nested_braille_array[1][0].slice(14..15)
    full_braille_char_array[7] << nested_braille_array[2][0].slice(14..15)

    full_braille_char_array[8] << nested_braille_array[0][0].slice(16..17)
    full_braille_char_array[8] << nested_braille_array[1][0].slice(16..17)
    full_braille_char_array[8] << nested_braille_array[2][0].slice(16..17)

    full_braille_char_array
  end

  def find_english_letter(characters = @characters)
    all_letters
    braille_character_array = braille_parser
    braille_character_keys = braille_character_array.find_all {|array| !array.empty?}
    english_letters_array = braille_character_keys.map do |character|
       @braille_key_map[character]
    end
    english_letters_array.compact
  end
end


# require 'pry'; binding.pry. loop through till collection is empty, before starting group first three sub arrays into one element. one element as a collection of three arrays. enumerables to get two elements
#
#  full_braille_char_array = [[[], [], []],[[], [], []],[[], [], []]]
#  full_braille_char_array[0][0] << nested_braille_array[0][0].slice(0..1)
#  full_braille_char_array[0][1] << nested_braille_array[0][0].slice(2..3)
#  while full_braille_char_array[0][1] << nested_braille_array[0][0].slice(2..3) != nil
#    iterate over
# nested_braille_array.each do ||
# returns nested_braille_array.map {|row| row[0].slice(0..1)} a sinlge letter
 # read_original_file.each do |element|
   # full_braille_char_array[0][0] << element.slice(0..1)
   # full_braille_char_array[0][1] << element.slice(2..3)
   # full_braille_char_array[0][2] << element.slice(2..3)
 # end

# full_braille_char_array.each do

#   full_braille_char_array[0] << nested_braille_array[0][0].slice(0..1)
#   full_braille_char_array[0] << nested_braille_array[1][0].slice(0..1)
#   full_braille_char_array[0] << nested_braille_array[2][0].slice(0..1)
# new # IDEA:
  # full_braille_char_array[number_of_rows, range begins] << nested_braille_array[0][0].slice(0..1)
  # full_braille_char_array.index([".0", "0.", "0."]) - returns the index
  # end


  #  ****old solution for braille_parser method
  # full_braille_char_array = Array.new(number_of_rows) {Array.new(0,'')}
  # require 'pry'; binding.pry
  # full_braille_char_array[0] << nested_braille_array[0][0].slice(0..1)
  # full_braille_char_array[0] << nested_braille_array[1][0].slice(0..1)
  # full_braille_char_array[0] << nested_braille_array[2][0].slice(0..1)
  #
  # full_braille_char_array[1] << nested_braille_array[0][0].slice(2..3)
  # full_braille_char_array[1] << nested_braille_array[1][0].slice(2..3)
  # full_braille_char_array[1] << nested_braille_array[2][0].slice(2..3)
  #
  # full_braille_char_array[2] << nested_braille_array[0][0].slice(4..5)
  # full_braille_char_array[2] << nested_braille_array[1][0].slice(4..5)
  # full_braille_char_array[2] << nested_braille_array[2][0].slice(4..5)
  #
  # full_braille_char_array[3] << nested_braille_array[0][0].slice(6..7)
  # full_braille_char_array[3] << nested_braille_array[1][0].slice(6..7)
  # full_braille_char_array[3] << nested_braille_array[2][0].slice(6..7)


#  *****another solution

# # full_braille_char_array = [[[], [], []],[[], [], []],[[], [], []]]
# new_char_arry = Array.new(number_of_nested_arrays) {Array.new(3,'')}
# # require 'pry'; binding.pry
# original_braille_array.each do |element|
#   require 'pry'; binding.pry
#   new_char_arry[0][0] << element.slice(0..1)
#   # new_char_arry[0][1] << element.slice(2..3)
#   # new_char_arry[0][2] << element.slice(4..5)
#   # if new_char_arry[0].count > 2
#   #   # require 'pry'; binding.pry
#   #   new_char_arry[1][0] << element.slice(6..7)
#   #   new_char_arry[1][1] << element.slice(8..9)
#   #   new_char_arry[1][2] << element.slice(10..11)
#   # end
#   # if new_char_arry[0].count > 3
#   #   # require 'pry'; binding.pry
#   #   new_char_arry[2][0] << element.slice(12..13)
#   #   new_char_arry[2][1] << element.slice(14..15)
#   #   new_char_arry[2][2] << element.slice(16..17)
#   # end
# end
#  try using this to get the number of arrays
    # number_of_nested_arrays = ((nested_braille_array[0].map {|elem| elem.length})[0])/2
