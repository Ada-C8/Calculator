#Define mathematical methods
def add(a, b)
  return a + b
end

def subtract(a, b)
  return a - b
end

def multiply(a, b)
  return a * b
end

def divide(a, b)
  return a / b.to_f
end

def power(a, b)
  return a ** b.to_f
end

def modulus(a, b)
  return a % b
end

#Verify that entry is a number
def verify_number(number, which)
  until number.to_f.to_s == number || number.to_i.to_s == number
    print "Please enter a numerical value for your #{which} number: "
    number = gets.chomp
  end
  return number.to_f
end

#Determine whether to print a float or integer to the screen based on if it ends in zero (int)
def float_or_int(number)
  if number.to_s[-1] == "0"
    number = number.to_i
  end
  return number
end

#Wasn't used.... this is a work in progress....Will use gsub to replace the parenthesis with the number.
def parenth(number)
  if number.to_s[0] == "(" && number.to_s[-1] == ")"
    parenth_computation = number[1..(number.length)]
    find_numbers(parenth_computation)
    number = calculate(num1, operation, num2)
  else
    number = number
  end
  return number
end

#Calculates based on operation (Still need to delete extra words since they are replaced in line 108
def calculate(num1, operation, num2)
  case operation
  when "+", "add", "plus"
    operation = "+"
    result = add(num1, num2)
  when "-", "subtract", "minus"
    operation = "-"
    result = subtract(num1, num2)
  when "/", "divide"
    operation = "/"
    if num2 == 0
      result = "Error. Cannot divide by zero."
    else
      result = divide(num1,num2)
    end
  when "*", "x", "multiply", "times"
    operation = "*"
    result = multiply(num1, num2)
  when "power", "exponent", "^"
    operation = "^"
    result = power(num1, num2)
  when "modulus", "remainder", "%"
    operation = "%"
    result = modulus(num1, num2)
  else
    result = "42. Really, this isn't possible. But since 42 is the answer to life, the universe, and everything, we'll just assume it is also the answer to this operation that you've asked."
  end
end

#Prompt user to enter math expression
puts "Enter your mathematical expression using no spaces: "
computation = gets.chomp

#Prompts user to enter a valid math expression if they don't include an operator.
while math_hash.to_a.flatten & computation.split("") == []
  puts "Please enter a VALID mathematical expression"
  computation = gets.chomp
end

#A hash that uses words as keys and the math symbols as values so that words can be replaced by symbols.
math_hash = {
  "plus" => "+",
  "add" => "+",
  "subtract" => "-",
  "minus" => "-",
  "multiply" => "*",
  "times" => "*",
  "x" => "*",
  "divide" => "/",
  "power" => "^",
  "exponent" => "^",
  "modulus" => "%",
  "remainder" => "%"
}

#Replace math words with math symbols
math_hash.each do |key, value|
  computation.gsub!(key, value)
end

#Look for the index of the operator
math_regex = /-|\*|\+|\^|\*|\/|%/
operation_index = computation =~ math_regex

#Determine the first number, operation, and second number
num1 = computation[0...operation_index]
num1 = verify_number(num1, "first")
operation = computation[operation_index]
num2 = computation[operation_index+1..-1]
num2 = verify_number(num2, "second")

#Calculate result
result = calculate(num1, operation, num2)

#Determine if numbers should be printed as floats or integers.
num1 = float_or_int(num1)
num2 = float_or_int(num2)
result = float_or_int(result)

#Prints equation and result to the sceen. If the power symbol is used, the resulting printout also shows the supporting multiplication.
print "#{num1}#{operation}#{num2} = "
if operation == "^"
  print "#{num1}*" *(num2-1)
  print "#{num1} = "
end
puts "#{result}"
