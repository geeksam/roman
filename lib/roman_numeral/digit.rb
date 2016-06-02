class RomanNumeral

  class NullDigit
    def subtractive(*)
      ""
    end
  end

  Digit = Struct.new(:representation, :base_10, :successor) do
    alias to_i base_10

    def subtractive(integer)
      head = subtractive_chunk(integer)
      tail = successor.subtractive(integer % base_10)
      head + tail
    end

    protected

    def <(integer)
      integer.div(base_10) > 0
    end

    private

    def subtractive_chunk(integer)
      if self < integer
        representation * integer.div(base_10)
      else
        ""
      end
    end
  end

end
