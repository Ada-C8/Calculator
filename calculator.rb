#  calculating...beep beep beep
def do_some_math(num1, num2)
  while operator = gets.chomp # while loop keeps checking until things are TRUE
    # addition
    if ["add", "addition", "sum", "plus", "+"].include? operator
      return puts "#{num1} + #{num2} = #{num1 + num2}"
      # suctraction
    elsif ["subtract", "subtraction", "difference", "minus", "less", "take away", "-"].include? operator
      return puts "#{num1} - #{num2} = #{num1 - num2}"
      # multiplication
    elsif ["multiply", "multiplication", "product", "times", "*"].include? operator
      return puts "#{num1} * #{num2} = #{num1 * num2}"
      # division
    elsif ["divide", "division", "divide by", "divided by", "quotient", "division", "/"].include? operator
      if num2 == 0 # ya can't do that!!!!!
        return puts "#{num1} / 0 = ERROR DNE ERROR"
      else
        return puts "#{num1} / #{num2} = #{num1 / num2}"
      end
    else
      puts "I'm not sure what you want me to do!" # this happens if operator isn't available
      print "What do you need me to do with these numbers? "
    end
  end
end

#verify the input is a valid integer! No letters or symbols allowed
def valid_input()
  while n = gets.chomp # store string here
    if (n != "0") && (n.to_i == 0)
      puts "I can't do anything with #{n}!" # this happens if a letter, symbol, or 00..000000+ is entered
      print "Please enter a number: "
    else
      return n.to_i # okay NOW it can be an integer we can math on
    end
  end
end

# prompts
print "Please enter the first number: "
input_1 = valid_input()

print "Please enter the second number: "
input_2 = valid_input()

print "What do you need me to do with these numbers? "
input_operation = do_some_math(input_1, input_2) # I can't believe literally everything up above is represented in THIS ONE LINE
