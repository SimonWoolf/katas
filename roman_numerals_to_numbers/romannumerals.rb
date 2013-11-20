NUMERALS = {M:1000, C:100, L:50, X:10}#, V:5, I:1}

def roman_numeral_to_number(numeral)
  # NB Need to iterate NUMERALS in descending order
  NUMERALS.keys.each do |numeralchar|
    while numeral_begins_with?(numeral, numeralchar) do
      return single_numeral_to_number(numeralchar) + roman_numeral_to_number(numeral[1..-1])
    end
  end
  return units_numeral_to_number(numeral)
end

def numeral_begins_with?(numeral, first_char)
  !numeral.empty? && numeral[0].to_s == first_char.to_s
end

def single_numeral_to_number(char)
  NUMERALS[char]
end

def units_numeral_to_number(numeral)
  if numeral == ''
    0
  elsif numeral =~ /^I+$/
    numeral.length
  elsif numeral == 'IV'
    4
  elsif numeral == 'V'
    5
  elsif numeral == 'VI'
    6
  elsif numeral == 'VII'
    7
  elsif numeral == 'VIII'
    8
  elsif numeral == 'IX'
    9
  else
    numeral
  end
end