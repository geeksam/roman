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

  VALUES = {
    1000 => "M", 500  => "D",
    100  => "C", 50   => "L",
    10   => "X", 5    => "V",
    1    => "I",
  }
  def subtractive
    roman = ''
    remainder = n
    until remainder.zero? do
      next_value = VALUES.keys.detect {|val| remainder.div(val) > 0 }
      roman << roman_digit(remainder, next_value)
      remainder = remainder.modulo(next_value)
    end
    roman
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

  def roman_digit(remainder, value)
    roman = VALUES[value]
    roman * remainder.div(value)
  end

end
