# regex attempt
#   obj = obj.to_s unless obj.is_a? String
#   /\A[+-]?\d+(\.[\d]+)?\z/.match obj
# end

# receiving input from user
puts "Welcome! What operation would you like to do? (+ - / * % ^)"
op = gets.chomp
# handling when the user inputs anything other than an appropriate operation
op_arr = ["add", "subtract", "multiply", "divide", "modulo", "exponent", "+", "-", "*", "/", "%", "^"]
until op_arr.include? op
  puts "Please enter an appropriate operation: "
  op = gets.chomp
end

puts "Enter two numbers: "
numbers = []
# check if input numbers are valid
2.times do |i|
  begin
    numbers[i] = gets.chomp
    numbers[i] = Float(numbers[i])
  rescue
    puts "Please enter a valid number:"
    retry
  end
end

# regex way
# def is_numeric?(obj)
#    obj.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
# end


# defining a method and executing the maths
def math(op, num1, num2)
  if op == "add" || op == "+"
    return num1 + num2
  elsif op == "subtract" || op == "-"
    return num1 - num2
  elsif op == "multiply" || op == "*"
    return num1 * num2
  elsif op == "modulo" || op == "%"
    return num1 % num2
  elsif op == "exponent" || op == "^"
    return num1 ** num2
  elsif op == "divide" || op == "/"
    # how to handle if trying to divide by zero
    if num2 == 0
      puts "Your answer is undefined"
      return
    end
    return num1 / num2
  else
    puts "Please enter an available operation"
  end
end


math = math(op, numbers[0], numbers[1])
puts "Answer: #{math}"

if op == "add" || op == "+"
  puts "#{numbers[0]} + #{numbers[1]} = #{math}"
elsif op == "subtract" || op == "-"
  puts "#{numbers[0]} - #{numbers[1]} = #{math}"
elsif op == "divide" || op == "/"
  puts "#{numbers[0]} / #{numbers[1]} = #{math}"
elsif op == "multiply" || op == "*"
  puts "#{numbers[0]} * #{numbers[1]} = #{math}"
elsif op == "exponent" || op == "^"
  puts "#{numbers[0]} ^ #{numbers[1]} = #{math}"
else op == "modulo" || op == "%"
  puts "#{numbers[0]} % #{numbers[1]} = #{math}"
end
