class Fixnum
  def wordify
    number_to_words(self)
  end

  private

  UNITS_WORDS = %w(one two three four five six seven eight nine)
  TEENS_WORDS = %w(eleven twelve thirteen fourteen fifteen) + 
             %w(sixteen seventeen eighteen nineteen)
  TENS_WORDS = %w(ten twenty thirty forty fifty sixty seventy eighty ninety)
  GROUPING_WORDS = %w(million thousand)

  # TODO: make work with arbitrarily long numbers
  # refactor millions & thousands 

  def number_to_words(number)
    raise 'Can\'t deal with numbers that high' unless number < 1_000_000_000
    mill, thou, lastthree = split_into_triplets(number)
    words = triplet_to_words(mill, 'million') + 
            triplet_to_words(thou, 'thousand') + 
            triplet(lastthree, true)
    words.strip
  end

  def triplet_to_words(group, grouping_name)
    group!= 0 ? triplet(group, false) + ' ' + grouping_name + ' ' : ''
  end

  def triplet(number, is_last_triplet)
    hundreds(number) + (need_and?(number, is_last_triplet) ? 'and ' : '') + tensunits(number)
  end

  def need_and?(number, is_last_triplet)
    # if this is the last triplet, test if *whole number* is >100, not just 
    # if current triplet is.
    hundreds, tensunits = (is_last_triplet ? self : number).divmod(100)
    hundreds != 0 && tensunits != 0
  end

  def split_into_triplets(number)
    millions, rem = number.divmod(1_000_000)
    thousands, units = rem.divmod(1_000)
    [millions, thousands, units]
  end

  def hundreds(number)
    hundreds, tensunits = number.divmod(100)
    hundreds != 0 ? units_map(hundreds) + " hundred " : ''
  end

  def tensunits(number)
    tens, units = number.modulo(100).divmod(10)
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
    lasttwo = number.modulo(100)
    lasttwo >= 11 && lasttwo <= 19
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

end

