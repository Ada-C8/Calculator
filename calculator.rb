#Calculator Program: Week1 day4

#METHODS
def add(a, b)
  return "#{a} + #{b} = #{a + b}"
end


def subtract(a, b)
  return "#{a} - #{b} = #{a - b}"
end


def multiply(a, b)
  return "#{a} * #{b} = #{a * b}"
end


def divide(a, b)
  a = a.to_f
  b = b.to_f
  if b == 0
    puts "Undefined."
  else
    return "#{a} / #{b} = #{a / b}"
  end
end

def mod(a, b)
  return "#{a} % #{b} = #{a % b}"
end

def exp(a, b)
  return "#{a} ** #{b} = #{a ** b}"
end


def f_or_i(number)
  if number.include?(".")
    return number.to_f
  else
    return number.to_i
  end
end

def splitting(input)
  return input.split(" ")
end

def compare(newness, original)
  if newness.to_s != original
    puts "EEP! I'm going to *gracefully* convert your string to a 0 and multiply that."
  end
end
#if I can get the the parenthesis contained in one place


#USER INTERFACE
puts "Enter your equation. You must put spaces between numbers and operations."
operation = gets.chomp

until operation.include?("add") || operation.include?("+") || operation.include?("sub") ||
  operation.include?("-") || operation.include?("mul") || operation.include?("*") ||
  operation.include?("divide") || operation.include?("/") || operation.include?("%") ||
  operation.include?("mod") || operation.include?("**") || operation.include?("exp") || operation.include?("power")
  puts "Sorry, invalid operation. Please input your equation again."
  operation = gets.chomp
end

if operation.include?(" ")
  operation_modified = splitting(operation)
else
  puts "Sorry, please enter your equation with spaces."
end
#
# if operation.include?("(")
#     first_eval = operation.slice(operation.index("(")..operation.index(")")).split("")
#     first_eval.delete(" ")
#     first_eval.delete("(")
#     first_eval.delete(")")
#     puts "I made it through the loop. The array is #{first_eval}"
#
#     num3 = f_or_i(first_eval[0])
#     num4 = f_or_i(first_eval[2])
#
#     puts "here's num3: #{num3}."
#
#     if first_eval.include?("exp") || operation.include?("**") || operation.include?("power")
#       num2 = exp(num3, num4)
#     elsif first_eval.include?("mutliply") || operation_modified[1] == "*"
#       num2 = multiply(num3, num4)
#     elsif first_eval.include?("divide") || operation.include?("/")
#       num2 = divide(num3, num4)
#     elsif first_eval.include?("add") || operation.include?("+")
#       puts "it's addition!"
#       num2 = add(num3, num4)
#     elsif first_eval.include?("subtract")|| operation.include?("-")
#       puts "It's subtraction!"
#       num2 = subtract(num3, num4)
#     elsif first_eval.include?("%") || operation.include?("mod")
#       num2 = mod(num3, num4)
#     end
#     puts num2
#
#
#
# elsif operation.length == 3
#


  num1 = f_or_i(operation_modified[0])
  num2 = f_or_i(operation_modified[2])

  compare(num1, operation_modified[0])
  compare(num2, operation_modified[2])


  if operation.include?("exp") || operation.include?("**") || operation.include?("power")
    puts exp(num1, num2)
  end

  if operation.include?("mutliply") || operation_modified[1] == "*"
    puts multiply(num1, num2)
  end

  if operation.include?("divide") || operation.include?("/")
    puts divide(num1, num2)
  end

  if operation.include?("add") || operation.include?("+")
    puts add(num1, num2)
  end

  if operation.include?("subtract")|| operation.include?("-")
    puts subtract(num1, num2)
  end

  if operation.include?("%") || operation.include?("mod")
    puts mod(num1, num2)

  end


#end


#
# handles
# add/+
# subtract/-
# divide/ /
# multiply/*
# handles division by 0
# handles mod and exponents
#adding all on one line!!
#handles incorrect user input

##Still needs to handle parentheticals
