class RomanNumeral

  class NullDigit
    def additive(*)
      ""
    end

    def convert_to_subtractive(s)
      s
    end
  end

  Digit = Struct.new(:base_10, :representation, :successor, :add_run, :sub_run) do
    def subtractive(integer)
      s = additive(integer)
      convert_to_subtractive(s)
    end

    def additive(integer)
      head = additive_chunk(integer)
      tail = successor.additive(integer % base_10)
      head + tail
    end

    protected

    def convert_to_subtractive(s)
      s = s.gsub(add_run, sub_run)
      successor.convert_to_subtractive(s)
    end

    private

    def additive_chunk(integer)
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
