# Baseline

# The program should ask the user for an operation (string or numeric symbol) and two numbers.

# Primary Requirements

# The program should use the input operation and two numbers to provide the result of applying the 
# operation to the two numbers.

# The program should have support for these four operations: addition, subtraction, multiplication, 
# and division.
# The program should accept both the name (add) and the symbol (+) for each possible operation.

puts "give me a an operation, it can be a string or numeric symbol:"
operation = gets.chomp

puts "Please give me 2 numbers you'd like to do math on:"
num1 = gets.chomp.to_i
num2 = gets.chomp.to_i


def add(num1, num2)
	return num1 + num2
end

def subtract(num1, num2)
	return num1 - num2
end

def multiply(num1, num2)
	return num1 * num2
end

def division(num1, num2)
	return num1 / num2
end

if (operation =='add' || operation == '+'|| operation == 'addition' )
	result = add(num1, num2)
	puts "#{result}"
elsif(operation =='subtract' || operation == '-'|| operation == 'minus' )
	result = subtract(num1, num2)
	puts "#{result}"
elsif (operation =='multiply' || operation == '*'|| operation == 'product' )
	result = multiply(num1, num2)
	puts "#{result}"
elsif (operation =='division' || operation == '/'|| operation == 'divide' )
	result = division(num1, num2)
	puts "#{result}"
else
	puts "Please check if you have mispelled the operation type and try again..."
end
