def roman_numeral_to_number(input)
  numsarray = numeralstring_to_numsarray
end

def numeralstring_to_numsarray(numeralstring)
  numeralstring.split('').map{|char| singlechar_to_number(char)}
end

def break_into_ascending_chunks(numsarray)
  chunked_array = []
  i = 0
  loop do
    chunk = []
    chunk << numsarray[i]
    while numsarray[i+1] > numsarray[i] do
      chunk << numsarray[i+1]
      i += 1
      if (i+1 >= numsarray.length) then break end
    end
    chunked_array << chunk
    i += 1
    if (i+1 >= numsarray.length) then break end 
  end
  chunked_array
end

def singlechar_to_number(character)
  case numeral
  when 'I'
    1
  when 'V'
    5
  when 'X'
    10
  when 'L'
    50
  when 'C'
    100
  when 'M'
    1000
  end
end