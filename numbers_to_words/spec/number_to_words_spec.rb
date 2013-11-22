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

    it '10 into ten' do
      NumberToWords.wordify(10).should == "ten"
    end

    it '11 into eleven' do
      NumberToWords.wordify(11).should == "eleven"
    end

    it '16 into sixteen' do
      NumberToWords.wordify(16).should == "sixteen"
    end

    it '19 into nineteen' do
      NumberToWords.wordify(19).should == "nineteen"
    end

    it '20 into twenty' do
      NumberToWords.wordify(20).should == "twenty"
    end

    it '21 into twenty one' do
      NumberToWords.wordify(21).should == "twenty one"
    end

    it '99 into ninety nine' do
      NumberToWords.wordify(99).should == "ninety nine"
    end

    it '100 into one hundred' do
      NumberToWords.wordify(100).should == "one hundred"
    end

  end
  
end