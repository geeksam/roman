require_relative 'lib/roman_numeral.rb'

class Integer
  def to_roman
    RomanNumeral.new(self)
  end
end
