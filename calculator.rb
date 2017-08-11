puts "Welcome to the calculator."
puts "What operation would you like to perform?\n Your options are add(+), subtract(-),multiply(*),divide(/) or modulus(%).\n
Enter either a symbol or the word itself.\n>"
choice = gets.chomp.downcase

#setting up math hash

math = {
  "add" => "+" ,
  "subtract" => "-",
  "multiply" => "*",
  "divide" => "/",
  "modulus" => "%",
}

# check if oeration is a valid input

until math.has_key?(choice) || math.has_value?(choice)
  puts "Please follow the instructions. "
  choice = gets.chomp.downcase
end

#setting up operator

if math.values.include? choice
  operation = choice
else
  operation = math[choice]
end

# checking for valid number input

def getnumber
  num = gets.chomp
  while true #controls for nil class
    if num == "0"
      return 0
    elsif
      num != 0
      return num.include?(".") ? num.to_f : num.to_i
    elsif
      num[0] == "(" && num[-1] == ")"
      return eval(num) #doesn't work
    else
      print "Please enter a valid number:"
      num = gets.chomp
    end
  end
end


#getting number
puts "Now enter numbers: "
print "First number: "
num1 = getnumber
print "Second number: "
num2 = getnumber

# what if division of fixnums is less than 1? we don't want result to be zero
# if  operation == "/" &&  num1 > num2
#   solution = (num1).send(operation,(num2))
# else
#   num1 = num1.to_f
#   num2 = num2.to_f
# end

if  operation == "/" &&  num2 > num1 ?  num1 = num1.to_f : #<= else
  solution = (num1).send(operation,(num2))
end

if operation == "/" && num2 == 0
  solution = "Undefined. Can't divide with zero."
else
  solution = (num1).send(operation,(num2))
end

if solution % 2 == 0 #if result is a zero decimal float, turn it into fixnum
  solution = solution.to_i
elsif solution > 0 && solution < 1
  solution = solution.to_f
end

# neat output

puts "#{num1} #{operation} #{num2} = #{solution}"
