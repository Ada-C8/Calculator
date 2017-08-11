def enter_integer
  begin
    num = gets
    return Integer(num) rescue Float(num)
  rescue
    puts "Please enter an integer or floating number: "
    retry
  end
end

def div(num_one, num_two)
  if num_two != 0
    return num_one.to_f / num_two.to_f
  else
    return "NAN"
  end
end

def mod(num_one, num_two)
  if num_two != 0
    return num_one % num_two
  else
    return "NAN"
  end
end

operations = %w(add + subtract - divide / multiply * exponent ^ modulus %)

puts "Please enter an operation"
symbol = gets.chomp

until operations.include?(symbol)
  puts "Please enter a valid operation"
  symbol = gets.chomp
end

puts "Please enter number \#1: "
first_number = enter_integer

puts "Please enter number \#2: "
second_number = enter_integer

if symbol == "add" || symbol == "+"
  result = first_number + second_number
  print "#{first_number} + #{second_number}"

elsif symbol == "subtract" || symbol == "-"
  result = first_number - second_number
  answer = puts "#{first_number} - #{second_number}"

elsif symbol == "multiply" || symbol == "*"
  result = first_number * second_number
  puts "#{first_number} * #{second_number}"

elsif symbol == "divide" || symbol == "/"
  result = div(first_number, second_number)
  puts "#{first_number} / #{second_number}"

elsif symbol == "exponent" || symbol == "^"
  result = first_number ** second_number
  puts "#{first_number}^#{second_number}"

elsif symbol == "modulus" || symbol == "%"
  result = mod(first_number, second_number)
  puts "#{first_number} % #{second_number}"
end

if result.class == Float
  result = "%0.2f" %[result]
end
print " = #{result}"
