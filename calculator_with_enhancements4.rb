
# create methods to define 4 operators

def add(x,y)
  return x+y
end

def subtract(x,y)
  return x-y
end

def multiply(x,y)
  return x*y
end

def divide(x,y)
  return x/y
end

def exponent(x,y)
  return x**y
end

def modulo(x,y)
  return x%y
end

def valid_numeric_input(x)
  input_to_integer = x.to_i
  integer_back_to_string = input_to_integer.to_s
  if x == "0" || x == integer_back_to_string
    return true
  elsif x == "" || x != integer_back_to_string
    return false
  else
    return "error"
  end
end

# asks user for the type of operation
valid_operator = false

while valid_operator == false
  puts "What type of calculation do you want to do? Please enter one of the following options:
    add or +
    subtract or -
    multiply or x or *
    divide or /
    exponent or **
    modulo or %"

    operation = gets.chomp.downcase

  if operation == "add" || operation ==  "+" || operation == "subtract" || operation == "-" || operation == "multiply" || operation == "x" || operation == "*" || operation == "divide" || operation == "/" || operation == "modulo" || operation == "%"
      valid_operator = true
      puts "You have entered a valid operation: #{operation}"
  else
    puts  "You did not enter a valid operator!"
  end
end

# receives user inputs for 2 numbers and makes sure that, if division is being used, that the denominator (second number) is not equal to 0.

valid_first_number = false
while valid_first_number == false
  puts "Please enter the first number:"
  first_number = gets.chomp
    if valid_numeric_input(first_number) == false
      puts "That was not a valid input. Only numbers please!"
    else
      valid_first_number = true
    end
end

puts "you entered a valid first number: #{first_number}"

valid_second_number = false
while valid_second_number == false
  puts "Please enter the second number:"
  second_number = gets.chomp

    if (operation == "divide" || operation == "/" || operation == "modulo" || operation == "%") && second_number.to_f == 0
      valid_second_number = false
      puts "You cannot enter a zero value as a denominator."

    elsif valid_numeric_input(second_number) == false
      puts "That was not a valid input. Only numbers please!"

    else
        valid_second_number = true
    end
end

first_number = first_number.to_f
second_number = second_number.to_f

#interprets user input of the operation to apply the appropriate method
if operation == "add" || operation == "+"
  answer = add(first_number, second_number)
  puts "#{first_number} + #{second_number} = #{answer}"
elsif operation == "subtract" || operation == "-"
  answer = subtract(first_number, second_number)
  puts "#{first_number} - #{second_number} = #{answer}"
elsif operation == "multiply" || operation == "x" || operation == "*"
  answer = multiply(first_number, second_number)
  puts "#{first_number} * #{second_number} = #{answer}"
elsif operation == "divide" || operation == "/"
  answer = divide(first_number, second_number)
  puts "#{first_number} / #{second_number} = #{answer}"
elsif operation == "exponent" || operation == "**"
  answer = exponent(first_number, second_number)
  puts "#{first_number} / #{second_number} = #{answer}"
elsif operation == "modulo" || operation == "%"
  answer = modulo(first_number, second_number)
  puts "#{first_number} / #{second_number} = #{answer}"
end
