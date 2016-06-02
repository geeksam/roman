class RomanNumeral

  class NullDigit
    def subtractive(*)
      ""
    end

    def convert_to_additive(s)
      s
    end
  end

  Digit = Struct.new(:base_10, :representation, :successor, :sub_run, :add_run) do
    def additive(integer)
      s = subtractive(integer)
      convert_to_additive(s)
    end

    def subtractive(integer)
      head = subtractive_chunk(integer)
      tail = successor.subtractive(integer % base_10)
      head + tail
    end

    protected

    def convert_to_additive(s)
      s = s.gsub(sub_run, add_run)
      successor.convert_to_additive(s)
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
