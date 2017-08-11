def add(num1, num2)
  return num1 + num2
end

def subtract(num1, num2)
  return num1 - num2
end

def multiply(num1, num2)
  return num1 * num2
end

def divide(num1, num2)
  if num2 == 0
    return "#{num1} is not divisible by 0"
  else
    return num1 / num2
  end
end


def convert_to_num(num)
  until num.to_f.to_s == num || num.to_i.to_s == num
    print "I'm sorry, I did not understand. Please input a number (ex: 1): "
    num = gets.chomp
  end

  if num.include? "."
    return num.to_f
  else
    return num.to_i
  end
end


puts "What operation would you like to use? \n\nYour options are to add (+), subtract (-), multiply (*) or divide (/): "
operation = gets.chomp
possible_operators = ["add", "+", "subtract", "-", "multiply", "*", "divide", "/"]
until possible_operators.include?(operation)
  print "I'm sorry, the only available options are to add (+), subtract (-), multiply (*) or divide (/): "
  operation = gets.chomp
end


puts "What is your first number? "
num1 = convert_to_num(gets.chomp)

puts "What is your second number? "
num2 = convert_to_num(gets.chomp)


case operation
when "add", "+"
  puts add(num1, num2)
when "subtract", "-"
  puts subtract(num1, num2)
when "multiply", "*"
  puts multiply(num1, num2)
when "divide", "/"
  puts divide(num1, num2)

end
