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

  def self.wordify(number)
    numarray = arrayify(number)
    numarray.size < 3 ? tens(numarray) : hundreds(numarray)
  end

  def self.hundreds(numarray)
    "one hundred"
  end

  def self.tens(numarray)
    if unit?(numarray)
      units_map(numarray[0])
    elsif teen?(numarray) 
      TEENS_MAP[numarray[1]]
    else
      numarray_to_wordarray(numarray).join(' ').strip
    end
  end

  def self.unit?(numarray)
    numarray.length == 1
  end

  def self.arrayify(number)
    return number.to_s.split('').map{|char| char.to_i}
  end

  def self.numarray_to_wordarray(numarray)
    [tens_map(numarray[0]), units_map(numarray[1])]
  end

  def self.teen?(numarray)
    numarray[0] == 1 && numarray[1] != 0
  end

  def self.tens_map(number)
    TENS_MAP[number] || ''
  end

  def self.units_map(number)
    UNITS_MAP[number] || ''
  end
end