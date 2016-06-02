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
  I = Digit.new( "I", 1,    __ )
  V = Digit.new( "V", 5,    I  )
  X = Digit.new( "X", 10,   V  )
  L = Digit.new( "L", 50,   X  )
  C = Digit.new( "C", 100,  L  )
  D = Digit.new( "D", 500,  C  )
  M = Digit.new( "M", 1000, D  )

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