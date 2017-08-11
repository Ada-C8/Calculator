# define add method
def add(a, b)
  return a + b
end

# define subtract method
def subtract(a, b)
  return a - b
end

# define multiply method
def multiply(a, b)
  return a * b
end

# define divide method
def divide(a, b)
  if b != 0
    return a / b
  elsif b == 0
    puts "NOT A NUMBER"
  end
end

# define method to check if input is an Integer
def is_integer(n)
  n.to_s =~ /[0-9]+/
  # n.is_a? Integer
end

puts "What kind of math would you like to do (+, -, *, or /)?"
operation = gets.chomp

puts "Give me a number:"
num1 = gets.chomp

# checks for erroneous number input
while is_integer(num1) == nil
  puts "NAN"
  puts "try again:"
  num1 = gets.chomp
end

puts "Give me another number:"
num2 = gets.chomp

# checks for erroneous number input
while is_integer(num2) == nil
  puts "NAN"
  puts "try again:"
  num2 = gets.chomp
end

if operation == "add" || operation == "+"
  puts "the answer is: #{add(num1.to_i, num2.to_i)}"
elsif operation == "subtract" || operation == "-"
  puts "the answer is: #{subtract(num1.to_i, num2.to_i)}"
elsif operation == "multiply" || operation == "*"
  puts "the answer is: #{multiply(num1.to_i, num2.to_i)}"
elsif operation == "divide" || operation == "/"
  puts "the answer is: #{divide(num1.to_i, num2.to_i)}"
else
  puts "not a valid response"
end
