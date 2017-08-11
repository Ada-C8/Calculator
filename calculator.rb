def get_number(value)
  # This method will prompt the user to enter a new input until their input is an integer or float.
  until value.to_f.to_s == value || value.to_i.to_s == value
    puts "Oops! This calculator only deals with numbers. Please enter a valid number."
    value = gets.chomp
  end

  return value
end

def convert_to_number(value2)
  # this method will convert the string value we got using gets.chomp into either a float or integer based on the presence of a ".", then return the value.
  # Helps program know when to return an integer or float
  if value2.include?(".")
    value2 = value2.to_f
  else
    value2 = value2.to_i
  end

  return value2
end

def calculator(num1,num2,operation)
  #this is the method that does the mathematical calculation and prints the formula.
  num1 = convert_to_number(num1)
  num2 = convert_to_number(num2)


  if operation == "add" || operation == "+"
    puts "#{num1} + #{num2} = #{num1 + num2}"
  elsif operation == "subtract" || operation == "-"
    puts "#{num1} - #{num2} = #{num1 - num2}"
  elsif operation == "multiply" || operation == "*"
    puts "#{num1} * #{num2} = #{num1 * num2}"
  elsif operation == "divide" || operation == "/"
    if num2 == 0
      puts "Error: Cannot divide by zero. Please try a different calculation."
    else
      puts "#{num1} / #{num2} = #{num1 / num2}"
    end
  elsif operation == "exponentiate" || operation == "^"
    powered= num1
    if num2 == 0
      puts "#{num1} ^ #{num2} = 1"
    else
      (num2-1).times do
        powered *= num1
      end
    end

    puts "#{num1} ^ #{num2} = #{powered}"
  elsif operation == "modulo" || operation == "%"
    puts "#{num1} % #{num2} = #{num1.modulo(num2)}"
  end

end

#### All code below interacts with the user interface of the calculator
puts "Welcome to the calculator!"

continue = nil

until continue == "no" # this gives user the option to do another calculation once they've finished their first one.
  operators = ["+", "add", "-", "subtract", "*", "multiply", "/", "divide", "%", "modulo", "^", "exponentiate"]
  num1= nil
  num2= nil

  puts "Please enter the math operation you'd like to perform. This calculator can add(+), subtract(-), multiply(*), divide(/), modulo(%), or exponentiate(^)."
  operation = gets.chomp.downcase
  until operators.include?(operation)
    # Prompts the user until they pick a valid, available operation.
    puts "Please enter a valid operation. We can add (+), subtract(-), multiply(*), divide(/), modulo(%), or exponentiate(^)."
    operation = gets.chomp.downcase
  end

  puts "Please enter your first number."
  num1 = gets.chomp
  num1 = get_number(num1)

  puts "Please enter your second number"
  num2 = gets.chomp
  num2 = get_number(num2)

  calculator(num1,num2,operation) #runs the calculation and prints the formula

  puts "Would you like to do another calculation? (yes/no)"
  continue = gets.chomp.downcase
end

puts "Thanks for using this calculator!"
