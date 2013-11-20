def roman_numeral_to_number(numeral)
  while numeral[0] == 'L' do
    return 50 + roman_numeral_to_number(numeral[1..-1])
  end
  while numeral[0] == 'X' do
    return 10 + roman_numeral_to_number(numeral[1..-1])
  end
  return units_numeral_to_number(numeral)
end

def eat_initial_letters(numeral, initial)
  while numeral[0] == initial do
    return single_numerals(initial) + roman_numeral_to_number(numeral[1..-1])
  end
end

def single_numerals(char)
  if char == 'X'
    10
  elsif char == 'L'
    50
  end
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