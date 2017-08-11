# GOAL: Build a calculator command line interface (CLI) that allows a user to
# perform simple arithmetic.

#trying to incorporate new knowledge of creating methods
#create a method per operation - currently feeling very repetitive.
#perhaps a way to automate or loop through this process

def add(num_1, num_2)
  return num_1 + num_2
end

def subtract(num_1, num_2)
  return num_1 - num_2
end

def multiply(num_1, num_2)
  return num_1 * num_2
end

def divide(num_1, num_2)
  if num_2 != 0
    return num_1 / num_2
  else
    return "You cannot divide by 0 - The value is undefined."
  end
end

def modulo(num_1, num_2)
	return num_1 % num_2
end

def exponent(num_1, num_2)
	return num_1 ** num_2
end

# function that will check for integer verfication
def int_ver(num_input)
 	standard_int =*("0".."9")

	num_input.each_char do |i|
		if !standard_int.include?(i)
			return false
		end
  	end

	return num_input.to_i
end

# array of possible operation values as strings because gets.chomp uses strings as input
op_arr = ["+", "add", "-", "subtract", "*", "multiply", "/", "divide", "%", "modulo", "exponent", "^", "**"]

# gather user input: operation
puts "What operation would you like to support? (can use symbols or word for operation)"
op = gets.chomp.to_s.downcase

# check for allowed operation values
until op_arr.include?(op)
  puts "I do not understand what operation you want me to do. Please reeneter."
  op = gets.chomp.to_s
end

# gather user input: 2 number values
puts "What two numbers would you like to perform an operation on?"

# verify input is an integer value and if so, add to number array to store and access values
numberArray = []
counter = 0
while counter < 2
	input = gets.chomp
	num = int_ver(input)
	if num
    	numberArray << num
		counter += 1
	else
		puts "number is not an integer"
		puts "Please enter a number."

	end
end

#incorporate user input to give the result of the operation of two numbers

answer = 0

if op == "add" || op == "+"
	if op == "add"
		op = "+"
	end
	puts answer = add(numberArray[0], numberArray[1])
elsif op == "subtract" || op == "-"
	if op == "subtract"
		op = "-"
	end
	puts answer = subtract(numberArray[0], numberArray[1])
elsif op == "multiply" || op == "*"
	if op == "multiply"
		op = "*"
	end
	puts answer = multiply(numberArray[0], numberArray[1])
elsif op == "divide" || op == "/"
	if op == "divide"
		op = "/"
	end
	puts answer = divide(numberArray[0], numberArray[1])
elsif op == "modulo" || op == "%"
	if op == "modulo"
		op = "%"
	end
	puts answer = modulo(numberArray[0], numberArray[1])
elsif op == "exponent" || op == "**" || op == "^"
	if op == "exponent" || op == "^"
		op = "**"
	end
	puts answer = exponent(numberArray[0], numberArray[1])
else
  puts "Operation input not clear. Please re-enter."
end

puts "#{numberArray[0]} #{op} #{numberArray[1]} = #{answer}"

# Test & Verify

# Before you submit your work it's important to test your program and ensure it's working properly.

# To make sure your program works you will need to run your program and ensure:

# The program adds numbers with both add and + - checked
# The program subtracts numbers with both subtract and - - checked
# The program adds numbers with both multiply and * - checked
# The program adds numbers with both divide and / - checked
# The program handles divide when attempting to divide by zero. - checked
# The program handles erroneous input. For example the user might enter clown when asked to enter a number.
# The program also needs to handle erroneous operators.

# Optional Enhancements

### DONE - Print out the formula in addition to the result, i.e. 2 + 2 = 4
### DONE - Add support for the modulo operator (10 % 3 = 1).
### Add support for computing exponents (2^4 = 2 * 2 * 2 * 2 = 16).
# Gracefully handle unexpected user input:
# What happens if the user input is nil (i.e., the user just pressed enter)?
# What happens if the user tries to add hotdog to elephant?


## Advanced
# Make your program know when it needs to return an integer versus a float.
# Add support for parentheticals, i.e. 10 / (5 + 5) = 1.
