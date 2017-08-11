=begin
Calculator that asks user for an operation and 2 numbers
Operations are +, -, *, /, %, ^ (and word equivalents)

Checks for non-numeric input and handles division by 0
=end

# checks for numeric input
def is_int(num)
  if num.match(/\A-?(\d+)\Z/)
    return true
  else
    return false
  end
end

# method that gets a number from user input
# returns input (str) as float
def get_num
  num = gets.chomp

  until is_int(num)
    puts "Integer, please: "
    num = gets.chomp
  end

  return num.to_i
end

# checks if given param is in the hash of given ops
# returns math operator as string if found; else empty string
def op_as_str(input)
  op_list = {add: "+",
             subtract: "-",
             divide: "/",
             multiply: "*",
             modulo: "%",
             exponent: "^"}

  if op_list.has_key? input.to_sym
    return op_list[input.to_sym]
  elsif op_list.has_value? input
    return input
  else
    return ""
  end

end

# method that gets an operation from user input
# accepts op as name or math symbol
def get_op

  op = gets.chomp.downcase

  # check that input entered
  until op.length > 0
    puts "Please pick an operation "
    op = gets.chomp.downcase
  end

  op = op_as_str(op)

  until op.length > 0
    puts "Operation, please "
    op = op_as_str(gets.chomp.downcase)
  end

  return op

end

# calculates math operation where op is a math operator as a string, and
# num1 and num2 are both numbers
# returns nil if division by zero
def calculate(op, num1, num2)

  result = case op
    when "+" then num1 + num2
    when "-" then num1 - num2
    when "*" then num1 * num2
    when "/"
      # check for division by zero
      if num2 == 0
        result = nil
      else
        result = num1.to_f / num2
        # check if ends in .0; convert to int if so
        if (result * 10) % 10 == 0
          result = result.to_int
        end
      end
    when "%" then num1 % num2
    when "^" then num1 ** num2
  end

  return result
end

# get user input
puts "CALCULATOR"

puts "\nNumber 1: "
num1 = get_num

puts "Number 2: "
num2 = get_num

puts "Math operator (+, -, *, /, %, ^): "
op = get_op

# ans = num1.public_send(op, num2)

ans = calculate(op, num1, num2)

if ans == nil
  puts "ERROR. Can't divide by zero"
else
  puts "#{num1} #{op} #{num2} = #{ans}"
end
