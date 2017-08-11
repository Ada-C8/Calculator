# method to process user input
def calculator(operation, num1, num2)
  if operation == "add" || operation == "+"
    equals_to = num1 + num2
    equals_to = final_result(equals_to)
    return "#{num1} + #{num2} = #{equals_to}"
  elsif operation == "subtract" || operation == "-"
    equals_to = num1 - num2
    equals_to = final_result(equals_to)
    return "#{num1} - #{num2} = #{equals_to}"
  elsif operation == "multiply" || operation == "*"
    equals_to = num1 * num2
    equals_to = final_result(equals_to)
    return "#{num1} * #{num2} = #{equals_to}"
  elsif operation == "divide" || operation == "/"
    # ensure second number is a positive number
    until num2 > 0
      puts "Uh oh, please enter a positive number for your second number: "
      num2 = gets.chomp.to_f
    end
    equals_to = num1 / num2
    equals_to = final_result(equals_to)
    return "#{num1} / #{num2} = #{equals_to}"
  elsif operation == "exponential" || operation == "^"
    equals_to = num1 ** num2
    equals_to = final_result(equals_to)
    return "#{num1}^#{num2} = #{equals_to}"
  else # modulo
    equals_to = num1 % num2
    equals_to = final_result(equals_to)
    return "#{num1} % #{num2} = #{equals_to}"
  end
end

# verify that user input is a number
def verify(user_input)
  until user_input.to_i.to_s == user_input || user_input.to_f.to_s == user_input
    puts "Please enter a number: "
    user_input = gets.chomp.to_f
  end
  return user_input
end

# check if result float is equal to integer value
# output final result
def final_result(equals_to)
  if equals_to % 1 == 0
    equals_to = equals_to.to_i
    return equals_to
  end # equals_to is not equal to integer value
    return equals_to
end

# prompt user for operation
puts "So you want to do some math!"
puts "First, would you like to add (+), subtract (-), multiply (*), divide (/), exponential (^), or modulo (%)?: "
print "> "

operation = gets.chomp

# verify user input

until operation == "add" || operation == "+" || operation == "subtract" || operation == "-" ||
  operation == "multiply" || operation == "*" || operation == "divide" || operation == "/" ||
  operation == "exponential" || operation == "^" || operation == "modulo" || operation == "%"
  puts "Please enter either add (+), subtract (-), multiply (*), divide (/), exponential (^), modulo (%): "
  print "> "
  operation = gets.chomp
end

# prompt user for two numbers

puts "Now, we need two numbers. First number: "
print "> "
num1 = gets.chomp
# verify user input
num1 = verify(num1).to_f

puts "Second number: "
print "> "
num2 = gets.chomp
# verify user input
num2 = verify(num2).to_f

result = calculator(operation, num1, num2)
puts "Final result: #{result}"
