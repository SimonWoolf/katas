class Fixnum
  def wordify
    number_to_words(self)
  end

  private

  UNITS_WORDS = %w(one two three four five six seven eight nine)
  TEENS_WORDS = %w(eleven twelve thirteen fourteen fifteen) + 
             %w(sixteen seventeen eighteen nineteen)
  TENS_WORDS = %w(ten twenty thirty forty fifty sixty seventy eighty ninety)
  GROUPING_WORDS = %w(trillion billion million thousand)

  # TODO: make work with arbitrarily long numbers
  # refactor millions & thousands 

  def number_to_words(number)
    raise 'Can\'t deal with numbers that high' unless number < 1_000_000_000_000_000
    trill, bill, mill, thou, units = split_into_triplets(number)
    words = triplet_to_words(trill, groupings_map(3)) + 
            triplet_to_words(bill, groupings_map(2)) + 
            triplet_to_words(mill, groupings_map(1)) + 
            triplet_to_words(thou, groupings_map(0)) + 
            last_triplet(units)
    words.strip
  end

  def triplet_to_words(group, grouping_name)
    group!= 0 ? last_triplet(group) + ' ' + grouping_name + ' ' : ''
  end

  def last_triplet(number)
    number < 100 ? tensunits(number) : hundreds(number)
  end

  def split_into_triplets(number)
    trillions, rem = number.divmod(1_000_000_000_000) 
    billions, rem = number.divmod(1_000_000_000)
    millions, rem = number.divmod(1_000_000)
    thousands, units = rem.divmod(1_000)
    [trillions, billions, millions, thousands, units]
  end

  def hundreds(number)
    hundreds, tensunits = number.divmod(100)
    units_map(hundreds) + " hundred" \
    + (tensunits != 0 ? " and " + tensunits(tensunits) : '') 
  end

  def tensunits(number)
    tens, units = number.divmod(10)
    if teen?(number) 
      teens_map(units)
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

  def mapify(wordarray)
    Hash[Array(1..9).zip(wordarray)]
  end

  def tens_map(number)
    mapify(TENS_WORDS)[number] || ''
  end

  def teens_map(number)
    mapify(TEENS_WORDS)[number] || ''
  end

  def units_map(number)
    mapify(UNITS_WORDS)[number] || ''
  end

  def groupings_map(number)
    Hash[Array(0..3).reverse.zip(GROUPING_WORDS)][number] || ''
  end

  def groupings(number_of_groupings)
    # [..., 1_000_000, 1000, 1]
    (1..number_of_groupings).inject([1]){|a| a << a.last*1000}
  end

end

