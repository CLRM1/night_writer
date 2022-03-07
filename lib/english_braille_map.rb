class English_Braille_Map

  attr_reader :english_key_map

  def initialize(letters)
    @english_key_map = {}
    @letters = letters
  end

  def letter_parser
    # require 'pry'; binding.pry
    @letters.map {|letter| letter.chomp.chars.map {|letter| letter.to_sym}}
  end

  def letters_a_through_g
    @english_key_map[:a] = ['0.','..','..']
    @english_key_map[:b] = ['0.','0.','..']
    @english_key_map[:c] = ['00','..','..']
    @english_key_map[:d] = ['00','.0','..']
    @english_key_map[:e] = ['0.','.0','..']
    @english_key_map[:f] = ['00','0.','..']
    @english_key_map[:g] = ['00','00','..']
  end

  def letters_h_through_n
    @english_key_map[:h] = ['0.','00','..']
    @english_key_map[:i] = ['.0','0.','..']
    @english_key_map[:j] = ['.0','00','..']
    @english_key_map[:k] = ['0.','..','0.']
    @english_key_map[:l] = ['0.','0.','0.']
    @english_key_map[:m] = ['00','..','0.']
    @english_key_map[:n] = ['00','.0','0.']
  end

  def letters_o_through_u
    @english_key_map[:o] = ['0.','.0','0.']
    @english_key_map[:p] = ['00','0.','0.']
    @english_key_map[:q] = ['00','00','0.']
    @english_key_map[:r] = ['0.','00','0.']
    @english_key_map[:s] = ['.0','0.','0.']
    @english_key_map[:t] = ['.0','00','0.']
    @english_key_map[:u] = ['0.','..','00']
  end

  def letters_v_through_z_and_space
    @english_key_map[:v] = ['0 .','0 .','00']
    @english_key_map[:w] = ['.0','00','.0']
    @english_key_map[:x] = ['00','..','00']
    @english_key_map[:y] = ['00','.0','00']
    @english_key_map[:z] = ['0 .','.0','00']
    @english_key_map[:" "] = ['..','..','..']
  end

  def all_letters
    letters_a_through_g
    letters_h_through_n
    letters_o_through_u
    letters_v_through_z_and_space
  end

  def find_braille_chars(letters = @letters)
    all_letters
    letter_array = letter_parser
    symbol_array = letter_array.flatten
    symbol_array.map do |char|
      @english_key_map[char]
    end
  end

end
