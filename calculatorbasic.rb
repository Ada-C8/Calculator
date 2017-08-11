operators_array = %w[+ add - subtract * multiply / divide]
num1 = nil
num2 = nil
answer = nil

puts "Welcome to the Calculator program!\n"
puts "What would you like to do (add (+), subtract (-), multiply (*) or divide (/))?"
operator = gets.chomp.to_s.downcase

# def correct_operator
#   if operators_array.include?(operator) == false
#   puts "That is not a valid option, please try again."
#   end
# end

until operators_array.include? (operator)
  puts "That is not a valid option, please try again."
  operator = gets.chomp.to_s
end


until num1 != nil && num2 != nil
  puts "What is the first number?"
  num1 = gets.chomp.to_f
  puts "What is the second number?"
  num2 = gets.chomp.to_f
  if num1 == nil || num2 == nil
    puts "Whoops, you entered something that isn't a number! Please try again."
  end
end

def math(operator, num1, num2)
  if operator == "+" || operator == "add"
    return num1 + num2
  elsif operator == "-" || operator == "subtract"
    return num1 - num2
  elsif operator == "*" || operator == "multiply"
    return num1 * num2
  else operator == "/" || operator == "divide"
    if num2 == 0
      puts "I'm sorry, I can't divide by 0. Please start over."
      exit
    else
      return num1 / num2
    end
  end
end




puts "The answer is #{math(operator, num1, num2)}."
