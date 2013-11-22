class Fixnum
  NUMERALS = #hash in descending order, 10, 9, 5, 4, 1
  #greedily appends from the hash, leaving the remainder
  arabic = self
  NUMERALS.each_pair do |k,v|
    timers, remainder = arabic.divmod(k)
    arabic = remainder
    roman << value * times if times > 0
  end
  roman

def number_to_roman_numeral(n)
end