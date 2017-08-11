
# Method to check if a string is numeric
class String
    def is_i?
       /\A[-+]?\d+\z/ === self
    end
end

# Method that returns calculator operations
# If argument attempts to divide zero it returns "Cannot divide by zero"
# If argument attempt to perform operation other than +,-,*,/,%,^ it returns "Operator is not supported"
def calculator(num1,operator,num2)
  if ["add", "+", "plus"].include? operator
    return num1 + num2
  elsif ["subtract", "-", "minus"].include? operator
    return num1 - num2
  elsif ["multiply", "*", "times"].include? operator
    return num1 * num2
  elsif ["power", "^"].include? operator
    return num1**num2
  elsif ["%", "modulo"].include? operator
    return num1 % num2
  elsif ["divide", "/"].include? operator
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
  if ["add", "+", "plus"].include? operator
    return "#{num1} + #{num2}"
  elsif ["subtract", "-", "minus"].include? operator
    return "#{num1} - #{num2}"
  elsif ["multiply", "*", "times"].include? operator
    return "#{num1} * #{num2}"
  elsif ["power", "^"].include? operator
    return "#{num1} ^ #{num2}"
  elsif ["%", "modulo"].include? operator
    return "#{num1} % #{num2}"
  elsif ["divide", "/"].include? operator
    return "#{num1} / #{num2}"
  else
    return "#{num1} #{operator} #{num2}"
  end
end

# Prompts user to enter a number, operation and another number
puts "Hey, I'm a calculator.  I take in arguments as number operator number. "
input = gets.chomp

# Splits input into array named calculation
calculation = input.split

# If user inputs more than 3 things, they will be prompted to re-enter input
# If user does not enter numbers, they will be prompted to re-enter inputs
i = 0
while i <= 1
  if calculation.length > 3 || calculation.length < 3
    puts "Please only enter 3 things! Number Operator Number"
    input = gets.chomp
    calculation = input.split
    puts calculation
  elsif (calculation[0].is_i? != true) || (calculation[2].is_i? != true)
    puts "I can only calculate numbers!  Make sure you put in number operation number."
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
eq = equation("#{calculation[0]}", "#{calculation[1]}", "#{calculation[2]}" )
puts "#{eq} = #{result}"
