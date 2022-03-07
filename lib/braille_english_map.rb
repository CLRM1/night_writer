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
    full_braille_char_array = []
    full_braille_char_array << nested_braille_array[0][0].slice(0..1)
    full_braille_char_array <<  nested_braille_array[1][0].slice(0..1)
    full_braille_char_array << nested_braille_array[2][0].slice(0..1)
  end

  def find_english_letter(characters = @characters)
    all_letters
    braille_character_key = braille_parser
    english_letter = @braille_key_map[braille_character_key]
  end
end
