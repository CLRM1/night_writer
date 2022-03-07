class BrailleEnglishMap

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
    # require 'pry'; binding.pry
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
    # require 'pry'; binding.pry. loop through till collection is empty, before starting group first thres sub arrays into one element. one element as a collection of three arrays. enumerables to get two elements
    full_braille_char_array
  end

  def find_english_letter(characters = @characters)
    all_letters
    braille_character_keys = braille_parser
    english_letters_array = braille_character_keys.map do |character|
       @braille_key_map[character]
    end
    english_letters_array.compact
  end
end


# full_braille_char_array.each do

#   full_braille_char_array[0] << nested_braille_array[0][0].slice(0..1)
#   full_braille_char_array[0] << nested_braille_array[1][0].slice(0..1)
#   full_braille_char_array[0] << nested_braille_array[2][0].slice(0..1)
# new # IDEA:
  # full_braille_char_array[number_of_rows, range begins] << nested_braille_array[0][0].slice(0..1)
  # full_braille_char_array.index([".0", "0.", "0."]) - returns the index
  # end
