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

def number_check(n)
  n.to_s =~ /[0-9]+/
end
puts "Enter two numbers: "
num1 = gets.chomp
num2 = gets.chomp

while number_check(num1) == nil || number_check(num2) == nil
  puts "Please enter a valid number: "
  num1 = gets.chomp
  num2 = gets.chomp
end
num1 = num1.to_f
num2 = num2.to_f

# non-method way of checking for number
# puts "Enter two numbers: "
# numbers = []
# # check if input numbers are valid
# 2.times do |i|
#   begin
#     numbers[i] = gets.chomp
#     numbers[i] = Float(numbers[i])
#   rescue
#     puts "Please enter a valid number:"
#     retry
#   end
# end

# regex way
# def is_numeric?(obj)
#    obj.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
# end


# defining a method and executing the maths
def math(op, num1, num2)
  if op == "add" || op == "+"
    answer = num1 + num2
    puts "#{num1} + #{num2} = #{answer}"
    return num1 + num2
  elsif op == "subtract" || op == "-"
    answer = num1 - num2
    puts "#{num1} - #{num2} = #{answer}"
    return num1 - num2
  elsif op == "multiply" || op == "*"
    answer = num1 * num2
    puts "#{num1} * #{num2} = #{answer}"
    return num1 * num2
  elsif op == "modulo" || op == "%"
    answer = num1 % num2
    puts "#{num1} % #{num2} = #{answer}"
    return num1 % num2
  elsif op == "exponent" || op == "^"
    answer = num1 ** num2
    puts "#{num1} ^ #{num2} = #{answer}"
    return num1 ** num2
  elsif op == "divide" || op == "/"
    # how to handle if trying to divide by zero
    if num2 == 0
      puts "Your answer is undefined"
      return
    end
    answer = num1 / num2
    puts "#{num1} / #{num2} = #{answer}"
    return num1 / num2
  else
    puts "Please enter an available operation"
  end
end

math = math(op, num1, num2)
puts "Answer: #{math}"
