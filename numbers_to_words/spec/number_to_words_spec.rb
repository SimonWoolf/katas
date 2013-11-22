require_relative '../number_to_words'

describe NumberToWords do
  context 'it should turn' do
    it '1 into one' do
      NumberToWords.wordify(1).should == "one"
    end

    it '2 into two' do
      NumberToWords.wordify(2).should == "two"
    end

    it '3 into three' do
      NumberToWords.wordify(3).should == "three"
    end
  end
  
end