# program to do arithmetic calculations

# methods for different arithmetic operations

def add(num1, num2)
  return num1 + num2
end

def sub(num1, num2)
  return num1 - num2
end

def mult(num1, num2)
  return num1 * num2
end

def div(num1, num2)
  return num1 / num2
end

def exponent(num1, num2)
  return num1 ** num2
end

def mod(num1, num2)
  return num1 % num2
end

math_operators = %w(+ add addition - subtract subtraction * multiply multiplication / divide division ** ^ exponent % modulus remainder)

zero_error_prevention = %w(/ divide division % modulus remainder)

puts "Welcome to the Calculator!"

# to prevent divide by zero errors
div_by_zero = "error"
until div_by_zero == "ok"

  # accepts user input for math operation to be performed

  puts "Please enter the math operation you want to perform:"
  math_operator = gets.chomp
  until math_operators.include? math_operator
    puts "Please enter a valid math operation"
    math_operator = gets.chomp
  end

  # accepts user input on numbers on which to perform calculations

  puts "Please enter your first number"
  num1 = gets.chomp
  until num1.to_f.to_s == num1 || num1.to_i.to_s == num1
    puts "Please enter a valid number"
    num1 = gets.chomp
  end
  num1 = num1.to_f

  puts "Please enter your second number"
  num2 = gets.chomp
  until num2.to_f.to_s == num2 || num2.to_i.to_s == num2
    puts "Please enter a valid number"
    num2 = gets.chomp
  end
  num2 = num2.to_f

  # to prevent divide by zero errors
  if zero_error_prevention.include?(math_operator) && num2!= 0.0
    div_by_zero = "ok"
  elsif zero_error_prevention.include?(math_operator) == false
    div_by_zero = "ok"
  end

  if div_by_zero == "error"
    puts "ERROR -- You cannot divide by 0. Please try another calculation"
  end

end

# performs the math calculation and displays the equation and answer

case math_operator
when "+", "add", "addition"
  result = add(num1, num2)
  puts "#{num1} + #{num2} = #{result}"
when "-", "subtract", "subtraction"
  result = sub(num1, num2)
  puts "#{num1} - #{num2} = #{result}"
when "*", "multiply", "multiplication"
  result = mult(num1, num2)
  puts "#{num1} * #{num2} = #{result}"
when "/", "divide", "division"
  result = div(num1, num2)
  puts "#{num1} / #{num2} = #{result}"
when "**", "^", "exponent"
  result = exponent(num1, num2)
  puts "#{num1} ^ #{num2} = #{result}"
when "%", "modulus", "remainder"
  result = mod(num1, num2)
  puts "#{num1} % #{num2} = #{result}"
end
