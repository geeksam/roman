class RomanNumeral

  class NullDigit
    def subtractive(*)
      ""
    end
  end

  Digit = Struct.new(:representation, :base_10, :successor) do
    def subtractive(integer)
      head = subtractive_chunk(integer)
      tail = successor.subtractive(integer % base_10)
      head + tail
    end

    private

    def subtractive_chunk(integer)
      if needs_representation?( integer )
        representation * integer.div(base_10)
      else
        ""
      end
    end

    def needs_representation?(integer)
      integer.div(base_10) > 0
    end
  end

end
