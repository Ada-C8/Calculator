# method to ensure user has entered a valid operator
def validate_operator(operator)
  valid_operators = ["+", "add", "-", "subtract", "*", "multiply", "/", "divide", "**", "exponent", "%", "modulo"]
  # check input against array of operators, strip of any whitespace characters
  until valid_operators.include?(operator)
    puts "That is not a valid operator. This calculator accepts add (+), subtract (-), multiply (*), divide (/), exponent (**), and modulo (%)"
    operator = gets.chomp.strip.downcase
  end
  # return the operator symbol for either symbol or word provided
  case operator
  when "add", "+"
      return "+"
    when "subtract", "-"
      return "-"
    when "multiply", "*"
      return "*"
    when "divide", "/"
      return "/"
    when "exponent", "**"
      return "**"
    when "modulo", "%"
      return "%"
  end
end

# method using regex to check that no alphabetic characters are used in number input
def valid_num(string)
  until !(string.match(/[a-z]/))
    puts "Please enter an integer or decimal number: "
    string = gets.chomp
  end
  # convert strings into floats and integers appropriately
  if string.match(/[[:digit:]]\.[[:digit:]]/)
    string = string.to_f
  elsif string.match(/[[:digit:]]/)
    string = string.to_i
  end
end

# perform the operation with the 2 numbers provided
def calculate(num_1, num_2, operator)
  case operator
  when "+"
    return num_1 + num_2
  when "-"
    return num_1 - num_2
  when "*"
    return num_1 * num_2
  when "/"
    return num_1 / num_2
  when "**"
    return num_1 ** num_2
  when "%"
    return num_1 % num_2
  end
end

# greet the user and get input
puts "Welcome to the Calculator App"
puts "Which operator would you like to use?"
operator = gets.chomp.strip.downcase

# make sure the user didn't accidentally hit enter without any input
while operator.empty?
  puts "That is not a valid operator. This calculator accepts add (+), subtract (-), multiply (*), divide (/), exponent (**), and modulo (%)"
  operator = gets.chomp.strip.downcase
end

operator = validate_operator(operator)

# get numbers and validate numbers
puts "First number:"
num_1 = valid_num(gets.chomp)

puts "Second number:"
num_2 = valid_num(gets.chomp)

# pass needed arguments to the calculate method
result = calculate(num_1, num_2, operator)
# print equation and result
puts "#{num_1} #{operator} #{num_2} = #{result}"
