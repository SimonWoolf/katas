NUMERALS = {M:1000, D:500, C:100, L:50, X:10, V:5, I:1} # Must be in descending order

def roman_numeral_to_number(numeral)
  return parse_initial_ascending_pair(numeral) while numeral_begins_with_ascending_pairs?(numeral)
  NUMERALS.keys.each do |numeralchar|
    return parse_initial_single(numeral, numeralchar) while numeral_begins_with?(numeral, numeralchar)
  end
  return zero_for_empty(numeral)
end

def parse_initial_ascending_pair(numeral)
  single_numeral(numeral[1]) - single_numeral(numeral[0]) + roman_numeral_to_number(numeral[2..-1])
end

def parse_initial_single(numeral, numeralchar)
  single_numeral(numeralchar) + roman_numeral_to_number(numeral[1..-1])
end

def numeral_begins_with_ascending_pairs?(numeral)
  numeral.length >= 2 && single_numeral(numeral[0]) < single_numeral(numeral[1])
end

def numeral_begins_with?(numeral, first_char)
  !numeral.empty? && numeral[0].to_s == first_char.to_s
end

def single_numeral(char)
  NUMERALS[char.to_sym]
end

def zero_for_empty(numeral)
  numeral.empty? ? 0 : numeral
end
