# The program should ask the user for an operation (string or numeric symbol) and two numbers.
#
# Primary Requirements
#
# The program should use the input operation and two numbers to provide the result of applying the operation to the two numbers.
#
# The program should have support for these four operations: addition, subtraction, multiplication, and division.
# The program should accept both the name (add) and the symbol (+) for each possible operation.
# Test & Verify
#
# Before you submit your work it's important to test your program and ensure it's working properly. Later we will teach you nifty ways to automate this testing, but for now we'll do things the old fashioned way.
#
# To make sure your program works you will need to run your program and ensure:
#
# The program adds numbers with both add and +
# The program subtracts numbers with both subtract and -
# The program adds numbers with both multiply and *
# The program adds numbers with both divide and /
# The program handles divide when attempting to divide by zero.
# The program handles erroneous input. For example the user might enter clown when asked to enter a number.
# The program also needs to handle erroneous operators.

# Optional Enhancements
#
# Print out the formula in addition to the result, i.e. 2 + 2 = 4
# Add support for computing exponents (2^4 = 2 * 2 * 2 * 2 = 16).
# Add support for the modulo operator (10 % 3 = 1).
# Gracefully handle unexpected user input:
# What happens if the user input is nil (i.e., the user just pressed enter)?
# What happens if the user tries to add hotdog to elephant?
# Make your program know when it needs to return an integer versus a float.
# Add support for parentheticals, i.e. 10 / (5 + 5) = 1.

# array of possible user_operator
array_user_operator_selections = [
  "+",
  "add",
  "-",
  "subtract",
  "*",
  "multiply",
  "/",
  "divide",
  "^",
  "power",
  "%"
  ]

# creating methods
def calculator(user_first_number, user_second_number, user_operator)
  if user_operator == "+" || "add"
    return user_first_number + user_second_number

  elsif user_operator == "-" || "subtract"
    return user_first_number - user_second_number

  elsif user_operator == "*" || "multiply"
    return user_first_number * user_second_number

  elsif user_operator == "/" || "divide"
    return user_first_number / user_second_number

  elsif user_operator == "^" || "power"
    return user_first_number ^ user_second_number

  elsif user_operator == "%" # This does not work as I expected. I will ask an instructor about ir.
    return user_first_number % user_second_number

  end
end

# Program introduction to user
puts "This is your handy calculator.

You can do any of the following calculations.
  - Add or +
  - Subtract or -
  - Multiply or *
  - Divide or /

You will be asked for two numbers and an operator e.g. add.
Let's get started.

Please enter your first number."

# Validate user number is a number ie float or integer. This code I do not understand and used it anyway.
begin
  user_first_number = Float(gets)
rescue ArgumentError
  puts "Enter a number i.e. 1, 0.6"
retry
end

puts "
Please enter your second number."

# Validate user number is a number ie float or integer.
begin
  user_second_number = Float(gets)
rescue ArgumentError
  puts "Enter a number i.e. 1, 0.6"
retry
end

# Ask user for operator
puts "Please enter your operator e.g. '+' and 'add'"
user_operator = gets.chomp.downcase

# Validate user operator
until array_user_operator_selections.include? user_operator do
  puts "Please enter a valid operator e.g. '+' and 'subtract'"
  user_operator = gets.chomp.downcase
end

# Output the calculation and result.
# Re output formula: I am not sure how to address user_operator being a word.
# I will noodle on it more.
puts "Thanks!

Here are both your formula and final answer!"

puts "#{user_first_number} #{user_operator} #{user_second_number} = #{calculator(user_first_number, user_second_number, user_operator)}"
