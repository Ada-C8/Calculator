def do_math(num1,operator,num2)

  if operator == "add" || operator == "+"
    # operator = "+"
    add_result = num1 + num2
    puts "#{num1} + #{num2} = #{add_result}"
  elsif operator == "subtract" || operator == "-"
    # operator = "-"
    sub_result = num1 - num2
    puts "#{num1} - #{num2} = #{sub_result}"
  elsif operator == "divide" || operator == "/"
    # operator = "/"
    if num2 == 0.0
      puts "Sorry! ERROR"
    else
      divide_result = num1 / num2
      puts "#{num1} / #{num2} = #{divide_result}"
    end
  elsif operator == "multiply" || operator == "*"
    # operator = "*"
    multiply_result = num1 * num2
    puts "#{num1} * #{num2} = #{multiply_result}"
  elsif operator == "modulo" || operator == "%"
    # operator = "%"
    modulo_result = num1 % num2
    puts "#{num1} % #{num2} = #{modulo_result}"
  else operator == "exponent" || operator == "**"
    # operator = "**"
    exponent_result = num1 ** num2
    puts "#{num1} ** #{num2} = #{exponent_result}"
  end
end

counter = 0
until counter > 0
  print "Welcome to the Crappy-Calculator\n\n"
  print "Enter your two numbers: "
  nums = gets.chomp.split

    # regex is checking each index within the nums array for characters from the alphabet.
    if /[a-zA-Z]/.match(nums[0]) || /[a-zA-Z]/.match(nums[1])
      puts "Sorry I only work with numbers"
    else
      # if regex doesnt match anything from the two indeces, the variables are created and the conditionals and nested conditionals execute.
      num1 = nums[0].to_f
      num2 = nums[1].to_f

      # num1.is_a? Float
      print"Choose your mathmatical operator (add(+) subtract(-) multiply(*) divide(/) modulo(%) exponent(**): "
      operator = gets.chomp
      acceptable_operators = ["+","add","-","subtract","multiply","*","/","divide","modulo","%", "exponent","**"]

        # if operator is included in the acceptable operators array, the conditional will complete and the counter will increase causing the loop to stop and the method to run.
        if acceptable_operators.include? operator
          counter +=1
        else
          puts "Sorry! not a valid operator"
        end
    end
end

do_math(num1,operator,num2)
