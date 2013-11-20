NUMERALS = {M:1000, D:500, C:100, L:50, X:10, V:5, I:1} # Must be in descending order

def roman_numeral_to_number(numeral)
  return parse_initial_ascending_pair(numeral) while numeral_begins_with_ascending_pairs?(numeral)
  NUMERALS.keys.each do |numeralchar|
    return parse_initial_single(numeral, numeralchar) while numeral_begins_with?(numeral, numeralchar)
  end
  return zero_for_empty(numeral)
end

private
def parse_initial_ascending_pair(numeral)
  (second_character_of(numeral) - first_character_of(numeral)) + third_till_last_of(numeral)
end

def parse_initial_single(numeral, numeralchar)
  single_numeral(numeralchar) + second_till_last_of(numeral)
end

def third_till_last_of(numeral)
  roman_numeral_to_number(numeral[2..-1])
end

def second_till_last_of(numeral)
  roman_numeral_to_number(numeral[1..-1])
end

def first_character_of(numeral)
  single_numeral(numeral[0])
end

def second_character_of(numeral)
  single_numeral(numeral[1])
end

def numeral_begins_with_ascending_pairs?(numeral)
  return false if numeral.length < 2 
  return first_character_of(numeral) < second_character_of(numeral)
end

def numeral_begins_with?(numeral, first_char)
  return false if numeral.empty?
  return numeral[0].to_s == first_char.to_s
end

def single_numeral(char)
  NUMERALS[char.to_sym]
end

def zero_for_empty(numeral)
  numeral.empty? ? 0 : numeral
end
