# Calculator

# defines calculate method, which performs a calculation
def calculate(operation, n1, n2)
  if operation == "add" || operation == "+"
    return "#{n1} + #{n2} = #{n1+n2}"
  elsif operation == "subtract" || operation == "-"
    return "#{n1} - #{n2} = #{n1-n2}"
  elsif operation == "multiply" || operation == "*"
    return "#{n1} * #{n2} = #{n1*n2}"
  elsif operation == "divide" || operation == "/"
    if n2 == 0
      return "undefined"
    else
      return "#{n1} / #{n2} = #{n1/n2}"
    end
  elsif operation == "exponent" || operation == "^"
    return "#{n1} ^ #{n2} = #{n1**n2}"
  elsif operation == "modulo" || operation == "%"
    return "#{n1} % #{n2} = #{n1%n2}"
  end
end

# defines number_check method, which gets input from the user and checks that input is numeric
def number_check(num)
  begin
    num = gets.chomp
    if num.include?(".")
      return num = Float(num)
    else
      return num = Integer(num)
    end
  rescue
    puts "Please enter a number"
    retry
  end
end

# stores operators in an array
operators = ["add", "+", "subtract", "-", "multiply", "*", "divide", "/", "exponent", "^", "modulo", "%"]

# prompts user for operator input and ensures valid operation
puts "What operation would you like to complete?"
operation = gets.chomp
while !(operators.include?(operation))
  puts "Please provide a valid operation"
  operation = gets.chomp
end

# prompts user for numbers and ensures validity of inputs
puts "What two numbers would you like to apply to the operation?"
puts "number 1"
num1 = number_check(num1)
puts "number 2"
num2 = number_check(num2)

# perform calculation
puts calculate(operation, num1, num2)
