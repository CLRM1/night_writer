class BreailleEnglishMap

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

end
