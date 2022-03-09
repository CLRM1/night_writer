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

  def braille_array_parser
    read_original_file = File.readlines("./lib/braille.txt")
    original_braille_array = read_original_file.map {|row| row.chop}
    original_braille_array[0].insert(-1, original_braille_array[3] + "..")
    original_braille_array[1].insert(-1, original_braille_array[4] + "..")
    original_braille_array[2].insert(-1, original_braille_array[5] + "..")
    original_braille_array.delete_at(3)
    original_braille_array.delete_at(3)
    original_braille_array.delete_at(3)
    original_braille_array
    # separates braille chacters into an array with three elements of strings (braille)
  end

  def braille_parser
    original_braille_array = braille_array_parser
    full_braille_char_array = [[],[],[],[],[],[],[],[],[],[],[],[],[]]
    full_braille_char_array[0] << original_braille_array[0].slice(0..1)
    full_braille_char_array[0] << original_braille_array[1].slice(0..1)
    full_braille_char_array[0] << original_braille_array[2].slice(0..1)
    full_braille_char_array[1] << original_braille_array[0].slice(2..3)
    full_braille_char_array[1] << original_braille_array[1].slice(2..3)
    full_braille_char_array[1] << original_braille_array[2].slice(2..3)
    full_braille_char_array[2] << original_braille_array[0].slice(4..5)
    full_braille_char_array[2] << original_braille_array[1].slice(4..5)
    full_braille_char_array[2] << original_braille_array[2].slice(4..5)
    full_braille_char_array[3] << original_braille_array[0].slice(6..7)
    full_braille_char_array[3] << original_braille_array[1].slice(6..7)
    full_braille_char_array[3] << original_braille_array[2].slice(6..7)
    full_braille_char_array[4] << original_braille_array[0].slice(8..9)
    full_braille_char_array[4] << original_braille_array[1].slice(8..9)
    full_braille_char_array[4] << original_braille_array[2].slice(8..9)
    full_braille_char_array[5] << original_braille_array[0].slice(10..11)
    full_braille_char_array[5] << original_braille_array[1].slice(10..11)
    full_braille_char_array[5] << original_braille_array[2].slice(10..11)
    full_braille_char_array[6] << original_braille_array[0].slice(12..13)
    full_braille_char_array[6] << original_braille_array[1].slice(12..13)
    full_braille_char_array[6] << original_braille_array[2].slice(12..13)
    full_braille_char_array[7] << original_braille_array[0].slice(14..15)
    full_braille_char_array[7] << original_braille_array[1].slice(14..15)
    full_braille_char_array[7] << original_braille_array[2].slice(14..15)
    full_braille_char_array[8] << original_braille_array[0].slice(16..17)
    full_braille_char_array[8] << original_braille_array[1].slice(16..17)
    full_braille_char_array[8] << original_braille_array[2].slice(16..17)
    full_braille_char_array[9] << original_braille_array[0].slice(18..19)
    full_braille_char_array[9] << original_braille_array[1].slice(18..19)
    full_braille_char_array[9] << original_braille_array[2].slice(18..19)
    full_braille_char_array[10] << original_braille_array[0].slice(19..20)
    full_braille_char_array[10] << original_braille_array[1].slice(19..20)
    full_braille_char_array[10] << original_braille_array[2].slice(19..20)
    full_braille_char_array[11] << original_braille_array[0].slice(21..22)
    full_braille_char_array[11] << original_braille_array[1].slice(21..22)
    full_braille_char_array[11] << original_braille_array[2].slice(21..22)
    full_braille_char_array
  end

  def find_english_letter(characters = @characters)
    all_letters
    braille_character_array = braille_parser
    braille_character_keys = braille_character_array.find_all {|array| !array.empty?}
    english_letters_array = braille_character_keys.map do |character|
       @braille_key_map[character]
    end
    english_letters_array
  end
end
