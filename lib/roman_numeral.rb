class RomanNumeral
  attr_reader :n
  def initialize(n)
    unless (1..3999).include?(n)
      fail ArgumentError, "Only numbers from 1 to 3,999 can be represented as Roman numerals!"
    end
    @n = n
  end

  def additive
    convert_to_additive subtractive
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
  #              |     |    |
  #              |     |    |
  #              |     |    |
  #              V     V    V
  I = Digit.new( 1,    "I", __ )
  V = Digit.new( 5,    "V", I  )
  X = Digit.new( 10,   "X", V  )
  L = Digit.new( 50,   "L", X  )
  C = Digit.new( 100,  "C", L  )
  D = Digit.new( 500,  "D", C  )
  M = Digit.new( 1000, "M", D  )

  REPLACEMENTS = {
    "DCCCC" => "CM", "CCCC" => "CD",
    "LXXXX" => "XC", "XXXX" => "XL",
    "VIIII" => "IX", "IIII" => "IV",
  }
  def convert_to_additive(subtractive)
    out = subtractive
    REPLACEMENTS.each do |sub_form, add_form|
      out = out.gsub(sub_form, add_form)
    end
    out
  end

end
