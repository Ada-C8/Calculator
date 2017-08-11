#  Methods:
# Takes in the initialized hash of available operators (line#),
# the operator, first number, and second number user inputs
# Chooses which operator method to pick
def calculate(operatorHash, operator, num1, num2)
  if (operatorHash[:+].include? operator)
    add_nums(operator, num1, num2)
  elsif (operatorHash[:-].include? operator)
    subtract_nums(operator, num1, num2)
  elsif (operatorHash[:*].include? operator)
    multiply_nums(operator, num1, num2)
  elsif (operatorHash[:/].include? operator)
    divide_nums(operator, num1, num2)
  end
end

#Adds the two user numbers together
def add_nums(operator, num1, num2)
  puts num1 + num2
end

#Subtracts the two user numbers together
def subtract_nums(operator, num1, num2)
  puts num1 - num2
end

#Multiplies the two user numbers together
def multiply_nums(operator, num1, num2)
  puts num1 * num2
end

#Divides the two user numbers together
#UNLESS the denominator is 0
def divide_nums(operator, num1, num2)
  if num2 == 0
    puts "\nYou can't divide by 0"
  else
    puts (num1 / num2).to_f
  end
end

# ===========================

# Hash of available operators user can invoke with
# Organized according to the user's input's synonymous operator
operatorHash = {
  "+": ["add", "+"],
  "-": ["minus", "-"],
  "*": ["multiply", "*"],
  "/": ["divide", "/"],
}

puts "This is a CLI calculator!"
puts "The available operators are:"
puts "  'add' or '+',"
puts "  'subtract' or '-',"
puts "  'multiply' or '*',"
puts "  'divide' or '/'"

#Prompt user for operator, first number, and second number
print "Please type an operator: "
operator = gets.chomp.to_s

# Keep user stuck in loop until they put a valid operator
until operatorHash.values.flatten.include? operator
  print "\nPlease enter a valid operator: "
  operator = gets.chomp.to_s
end

puts "Now enter two numbers: "
print "  Number 1: "
num1 = gets.chomp.to_i

print "  Number 2: "
num2 = gets.chomp.to_i

print "Your answer is: "
calculate(operatorHash, operator, num1, num2)
