
#ask the user for an operation and two numbers
puts "Choose your operator: \nOptions \n+\n-\n*\n/\nadd\nsubtract\nmultiply\ndivide\n"
operator = gets.chomp.downcase

#array of valid operators
valid_operators = ["+", "-", "*", "/", "add", "subtract", "multiply", "divide"]

#check if chosen operator is valid
until valid_operators.include? operator
  puts "Please enter a valid operator:"
  operator = gets.chomp.downcase
end

#method that checks if numeric values are valid
class String
  def valid_float?
    Float(self) rescue false
  end
end

#input for 2 numeric values
puts "Please enter your first numeric value:"
value1 = gets.chomp
until value1.valid_float?
  puts "Please enter a valid numeric value:"
  value1 = gets.chomp
end
value1 = value1.to_f

puts "Please enter your second numeric value:"
value2 = gets.chomp
until value2.valid_float?
  puts "Please enter a valid numeric value:"
  value2 = gets.chomp
end
value2 = value2.to_f

#chooses operation based on operator
case operator
  when "+", "add"
    answer = value1 + value2
  when "-", "subtract"
    answer = value1 - value2
  when "*", "multiply"
    answer = value1 * value2
  when "/", "divide"
#checks for zeros as second value
#note: this doesn't also check if it's a valid float :(
    until value2 != 0
      puts "Please enter a valid value that isn't 0:"
      value2 = gets.chomp.to_f
    end
    answer = value1 / value2
  else puts "This means there's a break in my operators."
end

puts answer




=begin
class String
  def valid_float?
    # The double negation turns this into an actual boolean true - if you're
    # okay with "truthy" values (like 0.0), you can remove it.
    !!Float(self) rescue false
  end
end


def calculator(val1, val2)
  print operator_action
  val1.send operator_action, val2
end

print calculator(value1, value2)

#check if operator is not a string containing options
while operator != "+" && operator != "add" &&
  operator != "-" && operator != "subtract" &&
  operator != "*" && operator != "multiply" &&
  operator != "/" && operator != "divide"
  puts "Please enter a valid operation:"
  operator = gets.chomp.downcase
end

case operator
  when "+", "add"
    operator = "+"
  when "-", "subtract"
    operator = "-"
  when "*", "multiply"
    operator = "*"
  when "/", "divide"
    operator = ""
  else puts "::shrug::"
end

while operator == ask_operator
  puts "Please enter a valid operation:"
  operator = gets.chomp.downcase
end

#check if val1 and val2 are valid
#if operator is divide, second value CANNOT be 0
=end
