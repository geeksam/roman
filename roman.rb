class Integer
  def to_roman
    RomanNumeral.new(self).to_s
  end
end

class RomanNumeral
  attr_reader :n
  def initialize(n)
    @n = n
  end

  def to_s
    [ thousands, hundreds, tens, ones ].compact.join
  end

  private

  def thousands
    i = n.div(1000)
    fail ArgumentError if i > 3
    case i
    when 0 ; ''
    when 1 ; 'M'
    when 2 ; 'MM'
    when 3 ; 'MMM'
    end
  end

  def hundreds
    i = n.div(100) % 100
    digitize i, "C", "D", "M"
  end

  def tens
    i = n.div(10) % 10
    digitize i, "X", "L", "C"
  end

  def ones
    i = n % 10
    digitize i, "I", "V", "X"
  end

  def digitize(i, single, half_set, full_set)
    case i
    when 0 ; ''
    when 1 ; single * 1
    when 2 ; single * 2
    when 3 ; single * 3
    when 4 ; single + half_set

    when 5 ; half_set
    when 6 ; half_set + single * 1
    when 7 ; half_set + single * 2
    when 8 ; half_set + single * 3
    when 9 ; single + full_set
    end
  end

end

