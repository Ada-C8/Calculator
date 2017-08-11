#combine all if blocks into one method
def process_operator(operation, numbers)
  if operation == "add" || operation == "+"
    return do_math("+", numbers[0], numbers[1])
  elsif operation == "subtract" || operation == "-"
    return do_math("-", numbers[0], numbers[1])
  elsif operation == "multiply" || operation == "*"
    return do_math("*", numbers[0], numbers[1])
  elsif operation == "divide" || operation == "/"
    return do_math("/", numbers[0], numbers[1])
  elsif operation == "modulo" || operation == "%"
    return do_math("%", numbers[0], numbers[1])
  end
end


def get_number(operation)
  begin
    puts "What's your first number?"
    num1 = Integer(gets.chomp)

    puts "What's your second number?"
    num2 = Integer(gets.chomp)

    if operation == '/' && num2 == 0
      puts "You can't divide by zero! Try again."
      puts
      get_number(operation)
    else
     return num1, num2
    end

  rescue
    puts "Try again, you clown. Enter a valid number."
    puts
    get_number(operation)
  end
end

#combine these into one method
def do_math(operation,num1, num2)
  if operation == "+"
    puts "#{num1} + #{num2} = #{num1+num2}"
  elsif operation == "-"
    puts "#{num1} - #{num2} = #{num1-num2}"
  elsif operation == '*'
    puts "#{num1} * #{num2} = #{num1*num2}"
  elsif operation == '/'
    puts "#{num1} / #{num2} = #{num1.to_f/num2.to_f}"
  else
    puts "#{num1} % #{num2} = #{num1%num2}"
  end
end


puts "Welcome to the command line calculator!"
puts "Would you like to add, subtract, multiply, divide, or find a modulo?"

operation = gets.chomp
numbers = get_number(operation)
process_operator(operation, numbers)

puts "Thanks for using the command line calculator!"
