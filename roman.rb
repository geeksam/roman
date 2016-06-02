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

  VALUES = {
    1000 => "M", 500  => "D",
    100  => "C", 50   => "L",
    10   => "X", 5    => "V",
    1    => "I",
  }

  # Build number in chunks, recursively
  def next_chunk(n)
    return '' if n.zero?

    value = next_value(n)
    chunk = roman_digit(n, value)
    n = n.modulo(value)

    return chunk + next_chunk(n)
  end

  def next_value(n)
    VALUES.keys.detect {|val| n.div(val) > 0 }
  end

  def roman_digit(remainder, value)
    roman = VALUES[value]
    roman * remainder.div(value)
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
