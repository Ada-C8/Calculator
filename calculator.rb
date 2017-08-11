
def calculator(op, num1, num2)

  if op == "add" || op == "+"
    return puts "#{num1} + #{num2} = #{num1 + num2}"
  elsif op == "subtract" || op == "-"
    return puts "#{num1} - #{num2} = #{num1 - num2}"
  elsif op == "multiply" || op == "*"
    return puts "#{num1} * #{num2} = #{num1 * num2}"
  elsif op == "devide" || op == "/"
    if num2 == 0
      puts "You can't devide by zero! Please try again."
      return
    end
    return puts "#{num1} / #{num2} = #{num1 / num2}"
  elsif op == "exponent" || op == "**"
    return puts "#{num1}^#{num2} = #{num1 ** num2}"
  elsif op == "modulo" || op == "%"
    return puts "#{num1} % #{num2} = #{num1 % num2}"
  end
end


puts "Please enter a number:"

begin
 first_number = gets.chomp
 first_number = Float(first_number)
rescue
  print "Please enter an numerical value!\n"
  retry
end


puts "Please enter a  second number:"

begin
 second_number = gets.chomp
 second_number = Float(second_number)
rescue
  print "Please enter an numerical value!\n"
  retry
end

puts "Please enter an calculation operation as a key or a symbol (for example :add or \"+\")"
 operation = gets.chomp

 until (operation == "add" || operation == "+" || operation == "subtract" || operation == "-" || operation == "multiply" || operation == "*" || operation == "devide" || operation == "/" || operation == "exponent" || operation == "**" || operation == "modulo" || operation == "%")
   puts "You need to enter one of the following as your mathematical opertation: add or + , subtract or - , multiply or * , devide or / , exponent or ** , modulus or % "
   operation = gets.chomp
 end

calculator(operation, first_number, second_number)



