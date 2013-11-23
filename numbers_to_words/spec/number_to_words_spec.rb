require_relative '../number_to_words'

describe Fixnum do
  context 'it should turn' do
    it '1 into one' do
      1.wordify.should == "one"
    end

    it '2 into two' do
      2.wordify.should == "two"
    end

    it '3 into three' do
      3.wordify.should == "three"
    end

    it '10 into ten' do
      10.wordify.should == "ten"
    end

    it '11 into eleven' do
      11.wordify.should == "eleven"
    end

    it '16 into sixteen' do
      16.wordify.should == "sixteen"
    end

    it '19 into nineteen' do
      19.wordify.should == "nineteen"
    end

    it '20 into twenty' do
      20.wordify.should == "twenty"
    end

    it '21 into twenty one' do
      21.wordify.should == "twenty one"
    end

    it '99 into ninety nine' do
      99.wordify.should == "ninety nine"
    end

    it '100 into one hundred' do
      100.wordify.should == "one hundred"
    end

    it '101 into one hundred and one' do
      101.wordify.should == "one hundred and one"
    end

    it '110 into one hundred and ten' do
      110.wordify.should == "one hundred and ten"
    end

    it '199 into one hundred and ninety nine' do
      199.wordify.should == "one hundred and ninety nine"
    end

    example '200' do
      200.wordify.should == "two hundred"
    end

    example '747' do
      747.wordify.should == "seven hundred and forty seven"
    end

    example '1000' do
      1000.wordify.should == "one thousand"
    end

    example '7125' do
      7125.wordify.should == "seven thousand one hundred and twenty five"
    end
    example '1000000' do
      1000000.wordify.should == "one million"
    end
    example '9_999_999' do
      9_999_999.wordify.should == "nine million nine hundred and ninety nine thousand nine hundred and ninety nine"
    end


  end
  
end