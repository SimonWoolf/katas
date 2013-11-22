class NumberToWords
  
  UNITS = Array(1..10)
  TEENS = Array(11..19)
  UNIT_WORDS = %W[one two three four five six seven eight nine ten]
  TEEN_WORDS = %W[eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen]
  WORD_MAP = Hash[UNITS.zip(UNIT_WORDS)]
  TEEN_MAP = Hash[TEENS.zip(TEEN_WORDS)]

  def self.wordify(number)
    number < 11 ? WORD_MAP[number] : TEEN_MAP[number]
  end

end