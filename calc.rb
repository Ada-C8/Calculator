def add(n1, n2)
  return n1+n2
end

def subtract(n1, n2)
  return n1 - n2
end

def multiply(n1, n2)
  return n1*n2
end

def divide (n1, n2)
  return n1/n2
end

puts "Welcome to the calculator!"

puts "Please enter your first number"
begin
  n1 = Float(gets.chomp)
  rescue
  puts "please enter an actual number"
  retry
return n1
end

puts "Please enter your second number"

begin
  n2 = Float(gets.chomp)
  rescue
  puts "please enter an actual number"
  retry
return n2
end


puts "Please enter an operation (+, -, *, / or add, subtract, multiply, divide)"
operator = gets.chomp
until ["+", "add", "Add", "-", "subtract", "Subtract", "*", "multiply", "Multiply", "/", "divide", "Divide"]
.include?(operator)
  puts "Please enter a valid operator"
  operator = gets.chomp
end

if operator == "+" || operator == "add" || operator == "Add"
  result = add(n1, n2)
  operator = "+"
elsif operator == "-" || operator == "subtract" || operator == "Subtract"
  result = subtract(n1, n2)
  operator = "-"
elsif operator == "*" || operator == "multiply" || operator == "Multiply"
  result = multiply(n1, n2)
  operator = "*"
else #operator == "/" || operator == "divide" || operator == "Divide"
  if n2 == 0
    puts "Dividing by zero is undefined"
    return
  else
    result = divide(n1, n2)
    operator = "/"
  end
end

puts "#{n1} #{operator} #{n2} = #{result}"
