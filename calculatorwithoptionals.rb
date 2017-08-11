
operators_array = ["+", "add", "-", "subtract", "*", "multiply", "/", "divide", "^", "to the power of", "%", "modulo" ]
num1 = nil
num2 = nil
answer = nil
total_operators = operators_array.length - 1

puts "Welcome to the Calculator program!\n"
puts "What would you like to do:"

i = 0
total_operators.times do
  print "#{operators_array[i]}, "
  i+=1
end
print "or #{operators_array.last}\n"
operator = gets.chomp.to_s.downcase

until operators_array.include? (operator)
  puts "#{operator} is not a valid option, please try again."
  operator = gets.chomp.to_s
end


until num1 == "0" || num1.class == Integer
  puts "What is the first number?"
  num1 = gets.chomp
  if num1 != "0" && num1.to_i == 0
    puts "Whoops, #{num1} isn't a number! Please try again."
    num1 = nil
  else num1 = num1.to_i
  end
end

until num2 == "0" || num2.class == Integer
  puts "What is the second number?"
  num2 = gets.chomp
  if num2 != "0" && num2.to_i == 0
    puts "Whoops, #{num1} isn't a number! Please try again."
    num2 = nil
  else num2 = num2.to_i
  end
end


def math(operator, num1, num2)
  if operator == "+" || operator == "add"
    return num1 + num2
  elsif operator == "-" || operator == "subtract"
    return num1 - num2
  elsif operator == "*" || operator == "multiply"
    return num1 * num2
  elsif operator == "/" || operator == "divide"
    if num2 == 0
      puts "I'm sorry, I can't divide by 0. Please start over."
      exit
    else
      return (num1.to_f / num2.to_f).round(2)
    end
  elsif operator == "^" || operator == "the the power of"
    return (num1.to_f / num2.to_f).round(2)
  elsif operator == "%" || operator == "modulo"
    return num1 % num2
  end
end

answer = "#{math(operator, num1, num2)}"
equation = "#{num1} #{operator} #{num2} = #{answer}"


puts "The answer is #{equation}."
