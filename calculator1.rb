# ******************
# Stage 1 Calculator
# ******************

# Method for calculator
def calculator(operation, num1, num2)

  # Variables created for each calculation type
  result_add = num1 + num2
  result_subtract = num1 - num2
  result_multiply = num1 * num2
  result_divide = num1 / num2
  result_exponent = num1 ** num2
  result_module = num1 % num2

  # Output based on operation type
  if operation == "+" || operation == "add"
    puts "#{num1} + #{num2} = #{result_add}"
  elsif operation == "-" || operation == "subtract"
    puts "#{num1} - #{num2} = #{result_subtract}"
  elsif operation == "*" || operation == "multiply"
    puts "#{num1} * #{num2} = #{result_multiply}"
  elsif operation == "/" || operation == "divide"
    # Divide by 0 output
    if num1 == 0 || num2 == 0
      puts "Dividing by zero is undefined!"
    else
      puts "#{num1} / #{num2} = #{result_divide}"
    end
  elsif operation == "^" || operation == "exponent"
    puts "#{num1} ^ #{num2} = #{result_exponent}"
  elsif operation == "%" || operation == "module"
    puts "#{num1} % #{num2} = #{result_module}"
  else
    # Error message, just in case
    puts "Hey! How'd this glitch happen?"
  end
end

puts "------------------"
puts "Let's do some math"
puts "------------------\n\n"

# Operation options stored in array for the until loop to scan over
operator_types = ["+", "add", "-", "subtract", "*", "multiply", "/", "divide", "^", "exponent", "%", "module"]

x = ""

# Until true, gets.chomp is a string that matches the array
until operator_types.include? x
puts "Would you like to add(+), subtract(-), multiply(*), divide(/), exponent(^), or module(%)?"
x = gets.chomp.downcase
user_operator = x
end

# Checks if gets is a float (integers work) retries until it is
puts "Please enter the first number:"
begin
user_num1 = Float(gets)
rescue ArgumentError
  puts "Try again"
retry
end

puts "Please enter the second number:"
begin
user_num2 = Float(gets)
rescue ArgumentError
  puts "Try again"
retry
end

# Runs method with user inputs
puts "\n"
calculator(user_operator, user_num1, user_num2)

puts "\n------------------"
puts "Calc-U-Later!"
puts "------------------"
