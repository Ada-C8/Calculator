error = "This input is invalid, please try again"
operator = ["add", "+", "subtract", "-", "multiply", "*", "divide", "/"]

## usersymb gets the user input of operator, makes sure is valid entry
puts "What operator?"
usersymb = gets.chomp.to_s.downcase
until operator.include?(usersymb)
  puts error
  usersymb = gets.chomp.to_s.downcase
end

## usernum gets the user input of numbers, makes sure they are numbers
usernum = []
puts "Two numbers:"
2.times do |n|
  begin
    usernum[n] = gets.chomp
    usernum[n] = Float(usernum[n])
  rescue
    puts error
    retry
  end
end



##I don't really get why I have to declare operator in the method if its already declared outside but I'm assuming it has something to do with scope.
# def math (symb, num1, num2)
# operator = ["add", "+", "subtract", "-", "multiply", "*", "divide", "/"]
#
#   if symb == operator[0] || symb == operator[1]
#     return num1 + num2
#
#   elsif symb == operator[2] || symb == operator[3]
#     return num1 - num2
#
#   elsif symb == operator[4] || symb == operator[5]
#     return num1 * num2
#
#   elsif symb == operator[6] || symb == operator[7]
#     if num2 == 0
#       return "undefined"
#     end
#     return num1 / num2
#
#   else
#     return "This input is invalid, please try again."
#
#   end
#
# end

##calculator method without using the operator array. Not sure which is better stylistically at this point, because of having to redeclare operator within the method?
def math (symb, num1, num2)

  if symb == "add" || symb == "+"
    return num1 + num2

  elsif symb == "subtract"|| symb == "-"
    return num1 - num2

  elsif symb == "multiply" || symb == "*"
    return num1 * num2

  elsif symb == "divide" || symb == "/"
    if num2 == 0
      return "undefined"
    end
    return num1 / num2

  end

end

puts math(usersymb, usernum[0], usernum[1])
