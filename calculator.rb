#Define a method to do a calcualtion with 3 elements - integer, operation, integer

def calculate (num1, operation, num2)
  if operation.end_with?("plus", "add", "+")
    return num1.to_i + num2.to_i
  elsif operation.end_with?("minus", "subtract", "-")
    return num1.to_i - num2.to_i
  elsif operation.end_with?("multiply", "times", "x", "X", "*")
    return num1.to_i * num2.to_i
  elsif operation.end_with?("divide", "over", "/")
    if num2.to_i == 0
      puts "No division by 0."
      return "fail."
    end
    return num1.to_i / num2.to_i
  elsif operation.end_with?("%", "mod")
    return num1.to_i % num2.to_i
  elsif operation.end_with?("^")
    return num1.to_i**num2.to_i
  end
end

#Define a method for ensuring that user inputs 3 elements at a time - integer, operation, integer

def check_user(input)
  until input.split.length == 3 && input.split[0] == input.split[0].to_i.to_s && input.split[2] == input.split[2].to_i.to_s && input.split[1].end_with?("plus", "add", "minus", "subtract", "multiply", "times",  "over", "divide", "+", "-", "*", "/", "^", "%", "mod")
    puts "Usage: integer operation integer. Try again!"
    input = gets.chomp
  end
  return input
end


puts "Welcome to Gale's Janky Calcluator!"
print "What are you trying to calculate? > "

expression = gets.chomp

expression = check_user expression

elements = expression.split


puts "#{expression} = #{calculate elements[0], elements[1], elements[2]}"
