class NumberToWords
  
  NUMBERS = Array(1..9)
  WORDS = %W[one two three four five six seven eight nine]
  WORD_MAP = Hash[NUMBERS.zip(WORDS)]

  def self.wordify(number)
    WORD_MAP[number]
  end

end