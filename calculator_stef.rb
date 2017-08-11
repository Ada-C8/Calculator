# Define methods first.
# Create function to deal with attempts to divide by zero.
def add(x,y)
  return x + y
end
def sub(x,y)
  return x - y
end
def multiply(x,y)
  return x * y
end
def divide(x,y)
  if x == 0 || y == 0
    puts "Please try another computation, we don't divide by zero around here."
    exit
  end
  return x / y
end


# Welcome user to the calculator program
# Give the user some instruction on what it is the program will do and what kind of input is necessary from the user.
puts "Welcome to the handy dandy calculator!"
puts "\nThis amazing device will add, subtract, multiply, and divide all the things!"
puts "\nIf you want to use a word or a symbol (i.e. +, -, *, /), it's up to you."

# How to handle erroneous input - while loop or specify input type?
# Start by asking user for the type of calculation they would like to do - User input.
puts "\nWhat kind of calculation would you like to do?"
operation = gets.chomp

# Ask for the first number to be calculated - User input.
puts "\nGive me your first number please."
n1 = gets.chomp.to_i || gets.chomp.to_f

# Ask for the second number to be calculated - User input.
puts "\nNow for your second number."
n2 = gets.chomp.to_i || gets.chomp.to_f

# If/elsif statements, which also call on methods created earlier.
# Create ability to use words and symbols for calculations.
if operation == 'add' || operation == '+'
  ret = add(n1,n2)
  puts "#{n1} + #{n2} = #{ret}"
elsif operation == 'sub' || operation == '-'
  ret = sub(n1,n2)
  puts "#{n1} - #{n2} = #{ret}"
elsif operation == 'multiply' || operation == '*'
  ret = multiply(n1,n2)
  puts "#{n1} * #{n2} = #{ret}"
elsif operation == 'divide' || operation == '/'
  ret = divide(n1,n2)
  puts "#{n1} / #{n2} = #{ret}"
end

# Thank user for using calculator.
puts "Thank you for using my extraordinarily simplistic calculator."
puts "Have a good day!"
