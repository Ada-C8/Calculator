# Welcome user to the program & let them know its capabilities
puts "Welcome to The Calculator of Your Dreams\u00A9\n\n"
puts "You can enter two numbers and choose your operation from the below list.\n\nOPERATIONS:\nAddition (+)\nSubtracton (-)\nMultiplication  (x)\nDivision (/)\nExponent (^)\nModulus (%)\n\n"

# Reset until user wants to quit program
again =
until again == "no"

  # Ask user for two numbers. Respond appropriately if user does not enter an integer or float.
  def is_number?(a)
    true if Float(a) rescue false
  end

  def is_float?(a)
    true if a.include?(".")
  end

  print "Pick a number: "
  num_one = gets.chomp

  until is_number?(num_one) == true
    print "That wasn't a number. C'mon. Pick a number: "
    num_one = gets.chomp
  end

  if is_float?(num_one)
    num_one = num_one.to_f
  else
    num_one = num_one.to_i
  end

  print "Pick a number: "
  num_two = gets.chomp

  until is_number?(num_two) == true
    print "That wasn't a number. C'mon. Pick a number: "
    num_two = gets.chomp
  end

  if is_float?(num_two)
    num_two = num_two.to_f
  else
    num_two = num_two.to_i
  end

  # Ask user for an operation & respond appropriately if they do not enter an operation
  operations = ["addition", "+", "subtracton", "-", "multiplication", "x", "division", "/" "exponent", "^", "modulus", "%"]

  print "What operation would you like to use? "
  operation = gets.chomp.downcase
  until operations.include?(operation)
    print "Sorry, that's not a valid operation.  Check the list above & try again, or wait for Dream Calculator 3000:  "
    operation = gets.chomp.downcase
  end

  # Execute operations with given input & allow user to enter either the word or symbol for their operator.  Output the formula & correct result.
  def add(a, b)
    return a + b
  end

  def multiply(a, b)
    return a * b
  end

  def divide(a, b)
    if a == 0 || b == 0
      return 0
    else
      return a / b
    end
  end

  def subtract(a, b)
    return a - b
  end

  def exponent(a, b)
    return a ** b
  end

  def modulus(a, b)
    return a % b
  end

  if operation == "addition" || operation == "+"
    puts "#{num_one} + #{num_two} = #{add(num_one, num_two)}"
  elsif operation == "subtraction" || operation == "-"
    puts "#{num_one} - #{num_two} = #{subtract(num_one, num_two)}"
  elsif operation == "multiplication" || operation == "x" || operation == "*"
    puts "#{num_one} * #{num_two} = #{multiply(num_one, num_two)}"
  elsif operation == "division" || operation == "/"
    puts "#{num_one} / #{num_two} = #{divide(num_one, num_two)}"
  elsif operation == "exponent" || operation == "^"
    puts "#{num_one} ^ #{num_two} = #{exponent(num_one, num_two)}"
  elsif operation == "modulus" || operation == "%"
    puts "#{num_one} % #{num_two} = #{modulus(num_one, num_two)}"
  end

  print "\n\nWanna try again? Yes or no: "
  again = gets.chomp.downcase

  if again == "yes"
    puts "Okay, hope next time is even more fun!"
  else
    puts "Fine. I hope you're finding another way to enjoy math."
  end
end
