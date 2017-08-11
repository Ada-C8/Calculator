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

def verify_number(number, which)
  until number.to_f.to_s == number || number.to_i.to_s == number
    print "Please enter a numerical value for your #{which} number: "
    number = gets.chomp
  end
  return number.to_f
end

def float_or_int(number)
  if number.to_s[-1] == "0"
    number = number.to_i
  end
  return number
end

def parenth(number)
  if number.to_s[0] == "(" && number.to_s[-1] == ")"

  else
  end
end

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

puts "Enter your mathematical expression using no spaces: "
computation = gets.chomp

while computation == ""
  puts "Enter your mathematical expression using no spaces: "
  computation = gets.chomp
end

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

math_hash.each do |key, value|
  computation.gsub!(key, value)
end

math_regex = /-\*|\+|\^|\*|\/|%/
operation_index = computation =~ math_regex

num1 = computation[0...operation_index]
num1 = verify_number(num1, "first")
operation = computation[operation_index]
num2 = computation[operation_index+1..-1]
num2 = verify_number(num2, "second")

result = calculate(num1, operation, num2)

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
