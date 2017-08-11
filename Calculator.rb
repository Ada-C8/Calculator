# Defined Methods
  # returns either integer or float value
  def return_int(number)
    if number == number.to_i
      number = number.to_i
    else
      number = number
    end
  end

  def add(num1, num2)
    result = num1 + num2
    result = return_int(result)
    num1 = return_int(num1)
    num2 = return_int(num2)
    puts "#{num1} + #{num2} = #{result}"
  end

  def subtract(num1, num2)
    result = num1 - num2
    result = return_int(result)
    num1 = return_int(num1)
    num2 = return_int(num2)
    puts "#{num1} - #{num2} = #{result}"
  end

  def multiply(num1, num2)
    result = num1 * num2
    result = return_int(result)
    num1 = return_int(num1)
    num2 = return_int(num2)
    puts "#{num1} * #{num2} = #{result}"
  end

  def divide(num1, num2)
    result = num1 / num2
    result = return_int(result)
    num1 = return_int(num1)
    num2 = return_int(num2)
    puts "#{num1} / #{num2} = #{result}"
  end

  def exponentiate(num1, num2)
    result = num1 ** num2
    result = return_int(result)
    num1 = return_int(num1)
    num2 = return_int(num2)
    puts "#{num1} ^ #{num2} = #{result}"
  end

  def modulo(num1, num2)
    result = num1 % num2
    result = return_int(result)
    num1 = return_int(num1)
    num2 = return_int(num2)
    puts "#{num1} / #{num2} has a remainder of #{result}"
  end

  # method tests if the input is a number, returns true if it is
  def is_number(str)
    str.to_f.to_s == str.to_s || str.to_i.to_s == str.to_s
  end

  # method tests if eval can return a value
  def eval_test(str)
    # check if input contains any non-valid characters
    return str if str!= str.split(/[^0-9\s\/*+\-()]/).join
    # check if first character of input will break the eval
    return str if str[0] =~ /[\/*+\-]/
    begin
      # return number elements of the input as floats, so they eval as the user intended
      # ACTUALLY WANT TO LEAVE THE non-numbers in the array, but can't use .split to do that with the following syntax
      # str_nums = str.split(/[\s\/*+\-()]/)
      # str_nums.each { |n| n = n.to_f }
      # print str_nums
      # str.each do |substr|
      #   substr = substr.to_f if is_number(substr)
      #   puts substr.class
      # end
      return eval(str)
    rescue
      return str
    end
  end


# Running the app
  puts "Welcome to the calculator!"
  puts %{What would you like to do? I know how to add (*), subtract (-), multiply (*), divide (/), exponentiate (^), and find a remainder (%).}
  action = gets.chomp.to_s.downcase
  all_actions = ["add", "+", "subtract", "-", "multiply", "*", "divide", "/", "exponentiate", "^", "find a remainder", "%"]

  until all_actions.include?(action)
    puts %{I'm sorry, please submit a valid action.  I know how to add (*), subtract (-), multiply (*), divide (/), exponentiate (^), and find a remainder (%).}
    action = gets.chomp.to_s.downcase
  end

   input_num1 = ""
   input_num2 = ""

  until is_number(input_num1)
    puts "Please enter your first expression.  Expressions can be numbers or more complex (i.e. 5 * 2 or (5 * 2) / 2)."
    input_num1 = eval_test(gets.chomp)
  end
  input_num1 = input_num1.to_f

  until is_number(input_num2)
    puts "Please enter your second expression.  Expressions can be numbers or more complex (i.e. 5 * 2 or (5 * 4) / 2)."
    input_num2 = eval_test(gets.chomp)
  end
  input_num2 = input_num2.to_f

  div_actions = ["divide", "/", "find a remainder", "%"]
  # prevent dividing by 0
  # (don't need to specify is_number here because any non-number converted to Float will be 0)
  while input_num2 == 0 && div_actions.include?(action)
    puts "Please select a non-zero expression to divide by.  Expressions can be numbers or more complex (i.e. 5 * 2 or (5 * 2) / 2)."
    input_num2 = eval_test(gets.chomp).to_f
  end

  case action
    when "add", "+"
      add(input_num1, input_num2)
    when "subtract", "-"
      subtract(input_num1, input_num2)
    when "multiply", "*"
      multiply(input_num1, input_num2)
    when "divide", "/"
      divide(input_num1, input_num2)
    when "exponentiate", "^"
      exponentiate(input_num1, input_num2)
    when "find a remainder", "%"
      modulo(input_num1, input_num2)
  end

  puts "Thank you for using the calculator!"
