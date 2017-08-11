# command line calculator
# array of operators for later use
op_arr = ["add", "+", "addition", "subtract", "subtraction", "-", "multiply", "*", "multiplication", "divide", "division", "/", "exponent", "^", "modulo", "remainder", "%"]

# array to store user input numbers
number = []

# methods for addition, subtraction, multiplication, division, exponents, and modulus

def add(a, b)
  return a + b
end

def sub(a, b)
  return a - b
end

def mult(a, b)
  return a * b
end

def div(a,b)
  if b == 0
    return "undefined"
  else
    return a / b
  end
end

def mod(a,b)
  return a % b
end

def exponent(a, b)
  return a ** b
end

# method for calculating and printing out the equation and solution to the user
def calculator(op, num1, num2)
  if op == "add" || op == "+" || op == "addition"
    return num1 + " + " + num2 + " = #{add(num1.to_i, num2.to_i)}"
  elsif op == "subtract" || op == "-" || op == "subtraction"
    return num1 + " - " + num2 + " = #{sub(num1.to_i, num2.to_i)}"
  elsif op == "multiply" || op == "*" || op == "multiplication"
    return num1 + " * " + num2 + " = #{mult(num1.to_i, num2.to_i)}"
  elsif op == "divide" || op == "/" || op == "division"
    return num1 + " / " + num2 + " = #{div(num1.to_i, num2.to_i)}"
  elsif op == "modulo" || op == "remainder" || op == "%"
    return num1 + " % " + num2 + " = #{mod(num1.to_i, num2.to_i)}"
  else op == "exponent" || op == "^"
    return num1 + "^" + num2 + " = #{exponent(num1.to_i, num2.to_i)}"
  end
end

# method using regex to ensure that the user's input is a number AKA a float or integer
def number?(obj)
  obj = obj.to_s unless obj.is_a? String
  /\A[+-]?\d+(\.[\d]+)?\Z/.match obj
end

puts "I am a calculator!"
puts "Please enter the type of math operation you want to perform"

# loop to ensure the user input for the mathematical operator is valid
op = gets.chomp.to_s
until op_arr.include?(op)
  puts "please enter a valid math operator"
  op = gets.chomp.downcase
end

# loop using the number? method - repeats until the user's inputs are numbers
2.times do |n|
  puts "Pick a number:"
  # number = nil
  loop do
    number[n] = gets.chomp
    break if number?(number[n])
    puts "That is not a number! Try again."
  end
end

puts "---"
puts calculator(op, number[0], number[1])
