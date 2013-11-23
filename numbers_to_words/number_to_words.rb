class Fixnum
  def wordify
    NumberToWords.wordify(self)
  end
end

class NumberToWords

  def self.mapify(wordarray)
    Hash[Array(1..9).zip(wordarray)]
  end

  UNITS_WORDS = %w(one two three four five six seven eight nine)
  TEENS_WORDS = %w(eleven twelve thirteen fourteen fifteen) + 
               %w(sixteen seventeen eighteen nineteen)
  TENS_WORDS = %w(ten twenty thirty forty fifty sixty seventy eighty ninety)
  UNITS_MAP = mapify(UNITS_WORDS)
  TEENS_MAP = mapify(TEENS_WORDS)
  TENS_MAP = mapify(TENS_WORDS)
  class << self
    def wordify(number)
      raise 'Can\'t deal with numbers that high' unless number < 1_000_000_000
      return millions(number).strip
    end

    def millions(number)
      millions, remainder = number.divmod(1_000_000)
      (millions != 0 ? triplets(millions) + ' million ': '') + thousands(remainder)
    end

    def thousands(number)
      thousands, remainder = number.divmod(1000)
      (thousands != 0 ? triplets(thousands) + ' thousand ': '') + triplets(remainder)
    end
    
    def triplets(number)
      number < 100 ? tensunits(number) : hundreds(number)
    end

    def hundreds(number)
      hundreds, tensunits = number.divmod(100)
      units_map(hundreds) + " hundred" \
      + (tensunits != 0 ? " and " + tensunits(tensunits) : '') 
    end

    def tensunits(number)
      tens, units = number.divmod(10)
      if teen?(number) 
        TEENS_MAP[units]
      else
        (tens != 0 ? tens_map(tens) + ' ' : '') + units_map(units)
      end
    end

    def unit?(numarray)
      numarray.length == 1
    end

    def teen?(number)
      number >= 11 && number <= 19
    end

    def tens_map(number)
      TENS_MAP[number] || ''
    end

    def units_map(number)
      UNITS_MAP[number] || ''
    end


  end
end