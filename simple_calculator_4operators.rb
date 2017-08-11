#SIMPLE CALCULATOR METHODS--------------------------------------------------

#is_numeric method (Invoked in the introduction method; it excludes + - * / but, to work it requires gets.chomp with no .to_f method)
def is_numeric?(obj)
   obj.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) != nil ? true : false
end

#introduction method (to introduce calculator to user)
def introduction
  puts "~~~~~" * 11
  puts "        * WELCOME TO THE SIMPLE CALCULATOR *  "
  puts "~~~~~" * 11
  puts "\n The Simple Calculator will accept TWO numbers to complete a math expression using one of the following operators:\n\n"

  #LOOP PRINTS THE CONTENTS OF THE OPERATORS ARRAY
  operators = ["add", "+", "subtract", "-", "multiply", "*", "divide", "/"]

  operators.each do |element|
    puts "  " + element
  end

 puts "\n CALCULATOR INSTRUCTIONS: \n First, you'll be prompted to enter your first number.
 Second, you'll enter which operator you would like to use from the list above.
 Third, you'll enter your second number. \n Afterwards your calculation result will print. Let's begin!"

end

#get_input_and_calculate method (to obtain first number, second number, & operator user input)

def get_input_and_calculate
  operators = ["add", "+", "subtract", "-", "multiply", "*", "divide", "/"]

  #GET FIRST NUMBER FROM USER
  puts "\n\nFirst number:"
  first_number = gets.chomp

  #VERIFY USER INPUT, NUMBERS ONLY:
  while !(is_numeric?(first_number))
    puts "Remember, numbers only! "
    first_number = gets.chomp
  end

  #GET OPERATION CHOICE FROM USER
  puts "OPERATOR:"
  user_operator = gets.chomp.downcase

  #VERIFY USER INPUT, ONLY OPERATORS IN operators array (non-case sensitive)
  while !(operators.include?(user_operator))
    puts "\nPlease enter an operator from the list of operator expressions above."
    puts "(NOTE: You may only enter ONE operator at a time. \nEx. If you want to add: enter the words \"addition\" OR the + [plus sign])"
    puts "\nOPERATOR OF CHOICE:"
    user_operator = gets.chomp.downcase
  end

  #GET SECOND NUMBER FROM USER
  puts "Second number:"
  second_number = gets.chomp

  #VERIFY USER INPUT, NUMBERS ONLY:
  while !(is_numeric?(second_number))
    puts "Remember, numbers only! "
    second_number = gets.chomp
  end

  #INVOKE: calculate method
  calculate(user_operator, first_number, second_number)
end

#calculate method (Provides control flow invoking each operator method based on user's operator input)
def calculate(user_operator, first_number, second_number)
  if user_operator == "+" || user_operator == "add"
    add(first_number, second_number)

  elsif user_operator == "-" || user_operator == "subtract"
    subtract(first_number, second_number)

  elsif user_operator == "*" || user_operator == "multiply"
    multiply(first_number, second_number)

  else #for division expression
    divide(first_number, second_number)
  end
end

#OPERATOR METHODS (Invoked in the calcuate method)

#add method
def add(num1, num2)
  result = num1.to_f + num2.to_f
  puts "\nAddition Calculation: " + "#{num1} + #{num2} = " + result.to_s
end

#subtract method
def subtract(num1, num2)
  result = num1.to_f - num2.to_f
  puts "\nSubtraction Calculation: " + "#{num1} - #{num2} = " + result.to_s
end

#multiply method
def multiply(num1, num2)
  result = num1.to_f * num2.to_f
  puts "\nMultiplication Calculation: " + "#{num1} * #{num2} = " + result.to_s
end

#divide method
def divide(num1, num2)
  if num2.to_f == 0
    puts "You cannot divide by zero! Please re-enter your math expression from the top."
    get_input_and_calculate
    return #so it breaks out of the first instance of divide with had num2 = 0
  end
  result = num1.to_f / num2.to_f
  puts "\nDivision Calculation: " + "#{num1} / #{num2} = " + result.to_s
end

#CODE TO RUN CALCULATOR--------------------------------------------------
# Introduce the calculator app.
introduction
# Ask the user for their calculator input & calculate
get_input_and_calculate
