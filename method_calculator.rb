# Method to check if a string is numeric
def is_num(number)
  if number.to_s == number.to_f.to_s
    return true
  elsif number.to_s == number.to_i.to_s
    return true
  else
    return false
  end
end

# Method that returns calculator operations
# If argument attempts to divide zero it returns "Cannot divide by zero"
# If argument attempt to perform operation other than +,-,*,/,%,^ it returns "Operator is not supported"
def calculator(num1,operator,num2)
  case operator
  when "add", "+", "plus"
    return num1 + num2
  when "subtract", "-", "minus"
    return num1 - num2
  when "multiply", "*", "times"
    return num1 * num2
  when "power", "^"
    return num1**num2
  when "%", "modulo"
    return num1 % num2
  when "divide", "/"
    if num2 == 0
      return "Cannot divide by zero"
    else
    return num1 / num2
    end
  else
    return "Operator is not currently supported"
  end
end

# Method that turns operations into appropriate math symbol
def equation(num1,operator,num2)
  case operator
  when "add", "+", "plus"
    return "#{num1} + #{num2}"
  when "subtract", "-", "minus"
    return "#{num1} - #{num2}"
  when "multiply", "*", "times"
    return "#{num1} * #{num2}"
  when "power", "^"
    return "#{num1} ^ #{num2}"
  when "%", "modulo"
    return "#{num1} % #{num2}"
  when "divide", "/"
    return "#{num1} / #{num2}"
  else
    return "#{num1} #{operator} #{num2}"
  end
end



# Prompts user to enter a number, operation and another number
puts " I take in arguments as number operator number. "
input = gets.chomp

# Splits input into array named calculation
calculation = input.split

# If user inputs more than 3 things, they will be prompted to re-enter input
# If user does not enter numbers, they will be prompted to re-enter inputs
i = 0
while i <= 1
  if [-1, 1].include? calculation.length <=> 3
    puts "Please only enter 3 things! Number Operator Number"
    input = gets.chomp
    calculation = input.split
  elsif (is_num(calculation[0]) != true) || (is_num(calculation[2]) != true)
    puts "\nI can only calculate numbers!  Make sure you put in number operation number."
    input = gets.chomp
    calculation = input.split
  else
    i += 1
  end
end

# Converts the first and last elements of user's input to floats and assigns them to variables
num1 = calculation[0].to_f
num2 = calculation[2].to_f

# Assigns the second element of user's input to operator variable
operator = calculation[1]

# Invokes calculator method with numbers and operator
result = calculator(num1, operator, num2)

# If the result ends with a .0, the result is displayed as an integer
if "#{result}".slice(-2..-1) == ".0"
  result = "#{result}".slice(0..-3)
else
end

# Invoked equation method to convert operator into appropriate mathematical symbol
# If operation is not supported by calculator, it will not change the operator
eq = equation("#{calculation[0]}", "#{calculation[1]}", "#{calculation[2]}" )

if "#{eq} = #{result}".length > 15
  short_result = "#{result}".slice(0..5) + "..."
  screen = "#{eq} = #{short_result}"
else
  screen = "#{eq} = #{result}"
end

# Prints results to calculator screen
puts " _____________________"
puts "|  _________________  |"
puts "  RESULT..."
puts ""
puts "    #{screen}     "
puts ""
puts "|  _________________  |"
puts "|  ___ ___ ___   ___  |"
puts "| | 7 | 8 | 9 | | + | |"
puts "| |___|___|___| |___| |"
puts "| | 4 | 5 | 6 | | - | |"
puts "| |___|___|___| |___| |"
puts "| | 1 | 2 | 3 | | x | |"
puts "| |___|___|___| |___| |"
puts "| | . | 0 | = | | / | |"
puts "| |___|___|___| |___| |"
puts "|_____________________|"
