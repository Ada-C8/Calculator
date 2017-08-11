def number_check(num)
until num.is_a?(Integer) do
		puts "Please input a whole number."
    num = Integer(gets.chomp) rescue nil
end
  return num
end

def operator_check(sign)
  until sign == "+" or sign == "add" or sign == "-" or
    sign == "subtract" or sign == "*" or sign == "multiply" or
    sign == "/" or sign == "divide" or sign == "^" or
    sign == "exponent" or sign == "**" or sign == "%" or
    sign == "mod" do
      puts "I don't recognize that function. Try again."
      sign = gets.chomp.downcase rescue nil
  end
    return sign
end

def do_math (sign, num1, num2)
  if sign == "+" or sign == "add"
    answer = num1 + num2
    puts "#{num1} + #{num2} =#{answer}"
   elsif sign == "-" or sign == "subtract"
    answer = num1 - num2
    puts "#{num1} - #{num2} =#{answer}"
  elsif sign == "*" or sign == "multiply"
    answer = num1 * num2
    puts "#{num1} * #{num2} =#{answer}"
  elsif sign == "/" or sign == "divide"
    if num2 == 0
      puts "Division by zero is undefined."
    else
      answer = num1 / num2
      puts "#{num1} / #{num2} =#{answer}"
    end
  elsif sign == "^" or sign =="exponent" or sign == "**"
    answer = num1 ** num2
    puts "#{num1} ** #{num2} =#{answer}"
  elsif sign == "%" or sign == "mod"
    answer = num1 % num2
    puts "#{num1} % #{num2} =#{answer}"
  else
    puts "Something's wrong. Do it again!"
  end
end


puts "Welcome to the Calculator!"
puts

puts "What is your first number?"
first_num = Integer(gets.chomp) rescue nil
first_num = number_check(first_num)

puts "What is your second number?"
second_num = Integer(gets.chomp) rescue nil
second_num = number_check(second_num)

puts "what is your operator?"
operator = gets.chomp.downcase rescue nil
operator = operator_check(operator)
do_math(operator, first_num, second_num)
