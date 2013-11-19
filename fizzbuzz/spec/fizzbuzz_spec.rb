require_relative('../fizzbuzz.rb')

describe FizzBuzz do
	context 'should replace multiples of' do
		it '15 with FizzBuzz' do
			FizzBuzz.fizzify(15).should == 'FizzBuzz'
			FizzBuzz.fizzify(0).should == 'FizzBuzz'
		end

		it '3 with Fizz' do
			FizzBuzz.fizzify(3).should == 'Fizz'
			FizzBuzz.fizzify(18).should == 'Fizz'
		end

		it '5 with Buzz' do
			FizzBuzz.fizzify(5).should == 'Buzz'
			FizzBuzz.fizzify(100).should == 'Buzz'
		end

		it 'all other numbers with themselves' do
			FizzBuzz.fizzify(2).should == 2
			FizzBuzz.fizzify(91).should == 91
		end
	end
end
