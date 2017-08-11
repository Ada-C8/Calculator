# Builds a calculator command line interface (CLI) that allows a user to perform simple arithmetic.
# tries some of the optional enhancements with some success and some fails
# for ada 01 ruby

error = "This input is invalid, please try again"
operator = {add: ["add", "+"], subtract: ["subtract", "-"], multiply: ["multiply", "*"], divide:["divide", "/"] }

## usersymb gets the user input of operator, makes sure is valid entry
puts "What operator?"
usersymb = gets.chomp.downcase

until operator[:add].include?(usersymb) || operator[:subtract].include?(usersymb) || operator[:multiply].include?(usersymb) || operator[:divide].include?(usersymb)
  puts error
  usersymb = gets.chomp.downcase
end
## this is messy and I don't like it, but I tried a bunch of different things that didn't work.

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
#  puts usernum #test


## math method does the basic calculations
def math (symb, num1, num2)

operator = {add:["+", "add"], subtract:["-", "subtract"], multiply:["*", "multiply"], divide:["/", "divide"] }

 # return operator[:add][0] #test

  if operator[:add].include?(symb)
    return num1 + num2

  elsif operator[:subtract].include?(symb)
    return num1 - num2

  elsif operator[:multiply].include?(symb)
    return num1 * num2

  elsif operator[:divide].include?(symb)
    if num2 == 0
      return "undefined"
    end
    return num1 / num2

  end

end

## writesymb method gets the right symbol for the output formula
def writesymb (symb)
  operator = {add:["+", "add"], subtract:["-", "subtract"], multiply:["*", "multiply"], divide:["/", "divide"] }

  if operator[:add].include?(symb)
    return operator[:add][0]
  elsif operator[:subtract].include?(symb)
    return operator[:subtract][0]
  elsif operator[:multiply].include?(symb)
    return operator[:multiply][0]
  elsif operator[:divide].include?(symb)
    return operator[:divide][0]
  end
end

puts "#{usernum[0]} #{writesymb(usersymb)} #{usernum[1]} = #{math(usersymb, usernum[0], usernum[1])}"





## attempted to do begin thing again and it didn't work.
# begin
#   usersymb = gets.chomp.downcase
#   usersymb = operator.include?
# rescue
#   puts error
#   retry
# end

#dead code
# if usernum1 != Integer(usernum1) || usernum2 != Integer(usernum2)
#   puts "This input is invalid, please try again"
# else
#   puts yay!
# end

# #tests for initial calculator
# puts math("add", 3, 4)
# puts math("-", 3, 4)
# puts math("multiply", 3, 4)
# puts math("/", 3, 4)
