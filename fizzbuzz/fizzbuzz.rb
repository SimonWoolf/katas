class FizzBuzz
	def self.fizzify(n)
		div_by_15?(n) ? 'FizzBuzz' : (div_by_5?(n) ? 'Buzz' : (div_by_3?(n) ? 'Fizz' : n)) 
	end

	def self.div_by_3?(n)
		# Recursively calculates the digital root of the number until it's one digit long
		n.to_s.length == 1 ? ([0,3,6,9].include? n) : div_by_3?(n.to_s.split('').map(&:to_i).inject(:+))
	end

	def self.div_by_5?(n)
		['0','5'].include? n.to_s[-1]
	end

	def self.div_by_15?(n)
		div_by_3?(n) && div_by_5?(n)
	end
end