require_relative '../romannumerals'

describe 'roman numerals to numbers' do

  it 'has the notion of a single numeral' do

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


    
  end
end