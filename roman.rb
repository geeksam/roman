class Integer
  def to_roman
    RomanNumeral.new(self)
  end
end

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
    next_chunk(n)
  end

  private

  Digit = Struct.new(:representation, :base_10, :successor) do
    alias to_i base_10

    def <(integer)
      integer.div(base_10) > 0
    end

    def %(integer)
      integer.modulo(base_10)
    end
  end

  I = Digit.new( "I", 1,    nil )
  V = Digit.new( "V", 5,    I   )
  X = Digit.new( "X", 10,   V   )
  L = Digit.new( "L", 50,   X   )
  C = Digit.new( "C", 100,  L   )
  D = Digit.new( "D", 500,  C   )
  M = Digit.new( "M", 1000, D   )

  DIGITS = [ M, D, C, L, X, V, I ]
  VALUE_HASH = Hash[ DIGITS.map {|e| [ e.to_i, e.representation ] } ]

  # Build number in chunks, recursively
  def next_chunk(n)
    return '' if n.zero?

    digit = next_digit(n)
    chunk = roman_digit(n, digit)
    n = digit % n

    return chunk + next_chunk(n)
  end

  def next_digit(n)
    DIGITS.detect {|val| val < n }
  end

  def roman_digit(remainder, digit)
    roman = VALUE_HASH[digit.to_i]
    roman * remainder.div(digit.to_i)
  end

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
