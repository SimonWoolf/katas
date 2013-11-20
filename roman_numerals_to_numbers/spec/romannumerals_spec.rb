require_relative '../romannumerals'

describe 'roman numerals to numbers' do

  context 'recognises ascending pairs' do
    it 'true for XC' do
      numeral_begins_with_ascending_pairs?('XC').should be_true
    end

    it 'false for VI' do
      numeral_begins_with_ascending_pairs?('VI').should be_false
    end

    it 'false for single char' do
      numeral_begins_with_ascending_pairs?('V').should be_false
    end
  end

  context 'recognises first letter' do
    it 'true for XC beginning with X' do
      numeral_begins_with?('XC', 'X').should be_true
    end
    
    it 'false for XC beginning with C' do
      numeral_begins_with?('XC', 'C').should be_false
    end
  end
  context 'should return' do
    it '1 for I' do
      roman_numeral_to_number('I').should == 1
    end

    it '2 for II' do
      roman_numeral_to_number('II').should == 2
    end

    it '3 for II' do
      roman_numeral_to_number('III').should == 3
    end

    it '4 for IV' do
      roman_numeral_to_number('IV').should == 4
    end

    it '5 for V' do
      roman_numeral_to_number('V').should == 5
    end

    it '6 for VI' do
      roman_numeral_to_number('VI').should == 6
    end

    it '7 for VII' do
      roman_numeral_to_number('VII').should == 7
    end

    it '8 for VIII' do
      roman_numeral_to_number('VIII').should == 8
    end
      
    it '9 for IX' do
      roman_numeral_to_number('IX').should == 9
    end
      
    it '10 for X' do
      roman_numeral_to_number('X').should == 10
    end
      
    it '11 for XI' do
      roman_numeral_to_number('XI').should == 11
    end
      
    it '20 for XX' do
      roman_numeral_to_number('XX').should == 20
    end

    it '19 for XIX' do
      roman_numeral_to_number('XIX').should == 19
    end

    it '50 for L' do
      roman_numeral_to_number('L').should == 50
    end

    it '90 for XC' do
      roman_numeral_to_number('XC').should == 90
    end

    example '400 for CD' do
      roman_numeral_to_number('CD').should == 400
    end


    example 'XXXVIII becomes 38' do
      expect(roman_numeral_to_number('XXXVIII')).to eq 38
    end

    example 'XCIX becomes 99' do
      expect(roman_numeral_to_number('XCIX')).to eq 99
    end

    example 'MCMLXXXVIII becomes 1988' do
      expect(roman_numeral_to_number('MCMLXXXVIII')).to eq 1988
    end

    it 'returns the expected output for the numbers 1..100' do
    fixture_path = File.dirname(__FILE__) + '/../first_3k.txt'
    numerals = IO.read(fixture_path).split("\n")

    (1..3000).each do |n|
      expect(roman_numeral_to_number(numerals[n-1])).to eq n
    end
  end
  end
end