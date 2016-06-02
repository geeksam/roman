class RomanNumeral
  attr_reader :n
  def initialize(n)
    unless (1..3999).include?(n)
      fail ArgumentError, "Only numbers from 1 to 3,999 can be represented as Roman numerals!"
    end
    @n = n
  end

  def additive
    M.additive(n)
  end

  def subtractive
    M.subtractive(n)
  end

  private

  require_relative 'roman_numeral/digit'

  __ = NullDigit.new
  #              base_10
  #              |     representation
  #              |     |    successor
  #              |     |    |   sub_run
  #              |     |    |   |        add_run
  #              |     |    |   |        |
  #              V     V    V   V        V
  I = Digit.new( 1,    "I", __, "",      ""   )
  V = Digit.new( 5,    "V", I,  "IIII",  "IV" )
  X = Digit.new( 10,   "X", V,  "VIIII", "IX" )
  L = Digit.new( 50,   "L", X,  "XXXX",  "XL" )
  C = Digit.new( 100,  "C", L,  "LXXXX", "XC" )
  D = Digit.new( 500,  "D", C,  "CCCC",  "CD" )
  M = Digit.new( 1000, "M", D,  "DCCCC", "CM" )

end
