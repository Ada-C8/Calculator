# This is a calculator you can run on your command line.

#DEFINE METHODS
#"is_op?" checks to make sure the user-proposed operation is
#  one of the supported options.
def is_op?(input, accept_arr)
  input=input.downcase
  ok = 1 if accept_arr.include?(input)
  ok = 0 if !accept_arr.include?(input)
  return ok
end

#"is_number?" checks that the user-proposed number
#  (which is stored in a string) is either an integer or a float
def is_number?(str)
  return str == str.to_f.to_s || str == str.to_i.to_s
end

#"float_or_interger" takes the user-proposed number (which is in a string)
#  and changes it into a float or integer, as appropriate.
def float_or_interger(str)
  if str.include?"."
    num =str.to_f
  else
    num = str.to_i
  end
  return num
end

#"op_convert" takes the inputed desired opperation string and compares
#  it to a hash which sets all equvilant inputs equal to a number
#  between 1 and 6, with the numbers representing +, -, *, /, **
#  and %, respectively.
def op_convert(input, hsh)
  return op = 1 if hsh[:add].include?(input)
  return op = 2 if hsh[:minus].include?(input)
  return op = 3 if hsh[:multiply].include?(input)
  return op = 4 if hsh[:divide].include?(input)
  return op = 5 if hsh[:exponent].include?(input)
  return op = 6 if hsh[:modulo].include?(input)
end


def do_math(op, num1, num2)
  if op == 1
    ans = num1 + num2
    puts "#{num1} + #{num2} = #{ans}"
  elsif op == 2
    ans = num1 - num2
    puts "#{num1} - #{num2} = #{ans}"
  elsif op == 3
    ans = num1 * num2
    puts "#{num1} * #{num2} = #{ans}"
  elsif op == 4
    ans = num1 / num2
    puts "#{num1} / #{num2} = #{ans}"
  elsif op == 5
    ans = num1 ** num2
    puts "#{num1} ^ #{num2} = #{ans}"
  elsif op == 6
    ans = num1 % num2
    puts "#{num1} % #{num2} = #{ans}"
  else
    puts "something is wrong in the do_math method"
  end
end


#DEFINE VARIABLES
#Keys are supported opperations. Values are an array of accepted
#  user-input to declare which opperation should be done.
accept_ops_h = Hash.new
accept_ops_h = {
  add:  %w(add + addition),
  minus: %w(subtract - minus),
  multiply: %w(multiply times bang *),
  divide: %w(divide /),
  exponent: %w(exponent ^ to_the_power_of **),
  modulo: %w(modulo %)
}

#an array of all accepted inputs
accept_ops_a = accept_ops_h.values.flatten


#CODE BODY
puts "Welcome to the comand line calculator"
puts ""

#gets desired opperation from user
puts "What operation would you like to do?"
input = gets.chomp!
while is_op?(input, accept_ops_a) == 0
  puts "That is not a valid operation in this calculator"
  puts  "This calculator supports the following opperations:"
  puts "+, -, *, /, %, and ^"
  input = gets.chomp!
end

#gets desired numbers from user
puts "Pick your first number"
num1= gets.chomp!
while !is_number?(num1)
  puts "That is not a number. Please enter a number."
  num1 = gets.chomp!
end
num1 = float_or_interger(num1)

puts "Now pick a second number"
num2= gets.chomp!
while !is_number?(num2)
  puts "That is not a number. Please enter a number."
  num2 = gets.chomp!
end

num2 = float_or_interger(num2)

#converts all possible acceptable enteries into either
#  +, -, /, *, % or **
op= op_convert(input, accept_ops_h)

#Does the math and puts out the equation and answer.  Pulls out the
#  special case of trying to divide by zero.
if op ==4 && num2 == 0
  puts "#{num1}/#{num2} = Undefined"
else
  do_math(op, num1, num2)
end
