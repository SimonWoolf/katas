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

    it '101 into one hundred and one' do
      NumberToWords.wordify(101).should == "one hundred and one"
    end

    it '110 into one hundred and ten' do
      NumberToWords.wordify(110).should == "one hundred and ten"
    end

    it '199 into one hundred and ninety nine' do
      NumberToWords.wordify(199).should == "one hundred and ninety nine"
    end

    example '200' do
      NumberToWords.wordify(200).should == "two hundred"
    end

    example '747' do
      NumberToWords.wordify(747).should == "seven hundred and forty seven"
    end

    example '1000' do
      NumberToWords.wordify(1000).should == "one thousand"
    end

    example '7125' do
      NumberToWords.wordify(7125).should == "seven thousand one hundred and twenty five"
    end
    example '1000000' do
      NumberToWords.wordify(1000000).should == "one million"
    end
    example '9_999_999' do
      NumberToWords.wordify(9_999_999).should == "nine million nine hundred and ninety nine thousand nine hundred and ninety nine"
    end


  end
  
end