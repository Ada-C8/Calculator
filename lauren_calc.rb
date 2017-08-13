# number? check
def num_check(num)
  begin
    num = gets.chomp
    if num.include?(".")
      return num = Float(num)
    else
      return num = Integer(num)
    end
  rescue
    puts "Please enter a valid number: "
    retry
  end
end


# defining a method and executing the maths
def add(num1, num2)
  return num1 + num2
end
def subtract(num1, num2)
  return num1 - num2
end
def multiply(num1, num2)
  return num1 * num2
end
def division(num1, num2)
  if num2 != 0
    return num1 / num2
  elsif b == 0
    puts "Not a number!"
  end
end
def modulo(num1, num2)
    return num1 % num2
end

# receiving operation input from user
puts "Welcome! What operation would you like to do? (+ - / * % ^)"
op = gets.chomp
# handling when the user inputs anything other than an appropriate operation
op_arr = ["add", "subtract", "multiply", "divide", "modulo", "exponent", "+", "-", "*", "/", "%", "^"]
until op_arr.include? op
  puts "Please enter an appropriate operation: "
  op = gets.chomp
end

# puts "Enter two numbers: "
puts "What two numbers would you like to apply to that operation?"
puts "Number 1: "
num1 = num_check(num1)
puts "Number 2: "
num2 = num_check(num2)

# def math(op, num1, num2)
case op
when "add", "+"
  answer = add(num1, num2)
  puts "#{num1} + #{num2} = #{answer}"
  # return num1 + num2
when "subtract", "-"
  answer = subtract(num1, num2)
  puts "#{num1} - #{num2} = #{answer}"
  # return num1 - num2
when "multiply", "*"
  answer = multiply(num1, num2)
  puts "#{num1} * #{num2} = #{answer}"
  # return num1 * num2
when "modulo", "%"
  answer = modulo(num1, num2)
  puts "#{num1} % #{num2} = #{answer}"
  # return num1 % num2
when "exponent", "^"
  answer = modulo(num1, num2)
  puts "#{num1} ^ #{num2} = #{answer}"
  return num1 ** num2
when "divide", "/"
  answer = division(num1, num2)
  puts "#{num1} / #{num2} = #{answer}"
  # return num1 / num2
else
  puts "Please enter an available operation"
end
