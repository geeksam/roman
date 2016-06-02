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
    M.subtractive(n)
  end

  private

  class NullDigit
    def subtractive(*)
      ""
    end
  end

  Digit = Struct.new(:representation, :base_10, :successor) do
    alias to_i base_10

    def <(integer)
      integer.div(base_10) > 0
    end

    def %(integer)
      integer.modulo(base_10)
    end

    def subtractive(integer)
      subtractive_chunk(integer) + successor.subtractive(integer % base_10)
    end

    def subtractive_chunk(integer)
      if self < integer
        representation * integer.div(base_10)
      else
        ""
      end
    end
  end

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
