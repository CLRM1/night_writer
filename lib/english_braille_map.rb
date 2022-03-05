class English_Braille_Map

  attr_reader :english_key_map

  def initialize(letter)
    @english_key_map = {}
    @letter = letter
  end

  def letters_a_through_g
    @english_key_map[:a] = ['0 .','. .','. .']
    @english_key_map[:b] = ['0 .','0 .','. .']
    @english_key_map[:c] = ['0 0','. .','. .']
    @english_key_map[:d] = ['0 0','. 0','. .']
    @english_key_map[:e] = ['0 .','. 0','. .']
    @english_key_map[:f] = ['0 0','0 .','. .']
    @english_key_map[:g] = ['0 0','0 0','. .']
  end

  def letters_h_through_n
    @english_key_map[:h] = ['0 .','0 0','. .']
    @english_key_map[:i] = ['. 0','0 .','. .']
    @english_key_map[:j] = ['. 0','0 0','. .']
    @english_key_map[:k] = ['0 .','. .','0 .']
    @english_key_map[:l] = ['0 .','. .','0 .']
    @english_key_map[:m] = ['0 0','. .','0 .']
    @english_key_map[:n] = ['0 0','. 0','0 .']
  end

  def letters_o_through_u
    @english_key_map[:o] = ['0 .','. 0','0 .']
    @english_key_map[:p] = ['0 0','0 .','0 .']
    @english_key_map[:q] = ['0 0','0 0','0 .']
    @english_key_map[:r] = ['0 .','0 0','0 .']
    @english_key_map[:s] = ['. 0','0 .','0 .']
    @english_key_map[:t] = ['. 0','0 0','0 .']
    @english_key_map[:u] = ['0 .','. .','0 0']
  end

  def letters_v_through_z
    @english_key_map[:v] = ['0 .','0 .','0 0']
    @english_key_map[:w] = ['. 0','0 0','0 .']
    @english_key_map[:x] = ['0 0','. .','0 0']
    @english_key_map[:y] = ['0 0','. 0','0 0']
    @english_key_map[:z] = ['0 .','. 0','0 0']
  end

  def all_letters
    letters_a_through_g
    letters_h_through_n
    letters_o_through_u
    letters_v_through_z
  end

  def find_braille_char(letter = @letter)
    all_letters
    @english_key_map[@letter].each do |char|
      # require 'pry'; binding.pry
      puts char
    end
  end

end
