class English_Braille_Map

  attr_reader :english_key_map

  def initialize
    @english_key_map = {}
  end

  def letter_a_through_g
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
end