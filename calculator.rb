# Meth(od) collection
def get_operator
  text2sign = {
    "add" => "+",
    "subtract" => "-",
    "multiply" => "*",
    "divide" => "/",
    "power" => "**",
    "remainder" => "%"
  }
  op = 0
  loop do
    puts "\nWhat's the core operation you want to do?"
    op = gets.chomp.downcase
    if op.length == 1 || op.length == 2
      text2sign.each do |key, value|
        if op == value
          return op = value
        end
      end
      puts "Come again?"
    elsif op.length > 1
      text2sign.each do |key, value|
        if op == key
          return op = value
        end
      end
      puts "I don't think that's right."
    end
  end
end

def get_half
  input = 0
  loop do
    puts "\nEnter a number or parenthetical expression."
    input = gets.chomp
    string = input.to_s

    if string.match(/\(/) == nil
      if string.to_i == 0 && string.to_f == 0 && string != "0"
        puts "\nWe need a mathy input, ok?"
      elsif string.to_i == string.to_f
        return string.to_i
      else
        if string.to_s == string.to_f.to_s
          return string.to_f
        end
      end
    else
      split_string = string.gsub(" ", "").split(/(\d+\.?\d*)/)
      split_string = split_string.delete_if {|x| x == "(" || x == ")"}
      expression = split_string.join(" ")
      check = eval(expression)
      if check.class == Float || check.class == Integer
        return check
      end
    end
  end
end

def zero_check(num2,op)
  loop do
    if (op == "/" || op == "%" ) && num2 == 0
      puts "Oh no, we can't allow division by zero."
      num2 = get_half
    else
      return num2
    end
  end
end

def clarify_result(num1, num2, op)
  num1 = num1.to_f
  num2 = num2.to_f
  result = num1.send(op,num2)
  if result.to_i == result.to_f
    return result.to_i
  else
    return result
  end
end

# Explanation of calculator
functions = [
  {define: "For ADDITION, enter ", sign: "+", text: "add" },
  {define: "For SUBTRACTION, enter ", sign: "-", text: "subtract" },
  {define: "For MULTIPLICATION, enter ", sign: "*",  text: "multiply" },
  {define: "For DIVISION, enter ", sign: "/", text: "divide" },
  {define: "For EXPONENTS, enter ", sign: "**", text: "power" },
  {define: "For REMAINDERS, enter ", sign: "%", text: "remainder" }
]
puts "\n========== Welcome to the calculator =========="
functions.each do |function|
  printf("%-28s %-4s %-3s %-10s\n", function[:define], function[:sign], "or", function[:text])
end
puts "================================================="

# Get all user inputs and check for zero division
op = get_operator
num1 = get_half
num2 = get_half
num2 = zero_check(num2, op)
result = clarify_result(num1, num2, op)

# Display calculation to user
puts "\n=========== Your Calculation Results ============"
puts("\n  #{num1}   #{op}   #{num2}   =   #{result}\n\n")
