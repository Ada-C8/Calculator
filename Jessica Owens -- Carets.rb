### CALCULATOR EXERCISE

## DEFINE VARIABLES
operators = {
  "+" => ["addition", "add", "+", "plus", "and", "ajoute"],
  "-" => ["subtract", "subtraction", "-", "minus", "less", "moins"],
  "*" => ["multiply", "multiplication", "times", "*", "fois"],
  "/" => ["divide", "division", "/", "divided by", "per", "over", "divise"],
  "^" => ["square", "power", "^", "power of", "to the power of", "squared", "carre", "to the"],
  "%" => ["modulus", "modulo", "remainder", "remainder of", "rem", "%", "mod"]
}

$op_display = "- add (+)
- subtract (-)
- multiply (*)
- divide (/)
- square (^)
- modulus (%)"

## DEFINE METHODS
# Checking for included operations
def check_ops(input, reqs) # where input is what we are testing & reqs is an array of values for which we are checking
  check = false
  until check
    reqs.each do |req|
      check = true if input == req
    end

    if !check
      puts "That is not a valid option. Please use one of the following:\n#{$op_display}"
      print "What operator would you like to use? "
      input = gets.chomp
    end
  end

  return input
end

# Checking for numbers
def check_vals(input)
  until !check_neg(input).gsub(".","").match?(/\D/) && input.strip.match?(/\d/) # [] Fix: Known issue- substitution allows for entries such as 3.0.5 to pass
    print "That is not a valid number. Please select another number: "
    input = gets.chomp
  end

  return input
end

# Perform calculations
def calculate(op,a,b)
  case op
  when "+"
    return a + b
  when "-"
    return a - b
  when "*"
    return a * b
  when "/"
    return a / b
  when "^"
    return a ** b
  when "%"
    return a % b
  end
end


## EXECUTION
# Get User input
puts "Welcome to a simple calculator? You can use the following operators:\n#{$op_display}"


print "Please enter your first value: "
val1 = check_vals(gets.chomp)

print "Choose your operator: "
# user_op = gets.chomp
user_op = check_ops(gets.chomp, operators.values.flatten)
disp_op = user_op # could be set to "", but just to be safe

# Convert user_op to symbol
operators.each do |key, value|
    disp_op = key if value.include? user_op
end

print "Please select your second value: "
val2 = check_vals(gets.chomp)

# Check to see if they're trying to divide by zero
while (disp_op == "/" || disp_op == "%") && val2.to_f == 0
  print "You cannot divide by zero. Select another value to divide by: "
  val2 = check_vals(gets.chomp)
end

# Display equation
if disp_op == "^" # Check if operator is ^ for formatting
  puts "This is your equation: #{val1.strip}#{disp_op}#{val2.strip}"
else
  puts "This is your equation: #{val1.strip} #{disp_op} #{val2.strip}"
end

# Display results
return_float = calculate(disp_op, val1.to_f, val2.to_f)
return_integer = calculate(disp_op, val1.to_i, val2.to_i)

unless return_integer == return_float
  puts "#{return_float}\n"
else
  puts "#{return_integer}\n"
end


## Plan for allowing parentheticals
# A. refactor to allow inline entry, split apart string into components (manage improper entry methods)...
# B. Allow for someone to enter () either together to indicate a group of entries will be processed together then passed through, and allow them to tell you when to exit such parentheticals (ie "exit") or to let them open a parens and check for a closed parens, validate entry and process, then return value for next part of calculation.
# [] Either way, would need to give explicit, simple human instructions for the users to understand capabilities.
# [] Formatting display of parentheticals similar to "^"...


### PROMPT
# Build a calculator command line interface (CLI) that allows a user to perform simple arithmetic.

### Baseline
# The program should ask the user for an operation (string or numeric symbol) and two numbers.

### Primary Requirements
# [X] The program should use the input operation and two numbers to provide the result of applying the operation to the two numbers.
# [X] The program should have support for these four operations: addition, subtraction, multiplication, and division.
# [X] The program should accept both the name (add) and the symbol (+) for each possible operation.

### Test & Verify
# [X] 1. The program adds numbers with both add and +
# [X] 2. The program subtracts numbers with both subtract and -
# [X] 3. The program adds numbers with both multiply and *
# [X] 4. The program adds numbers with both divide and /
# [X] 5. The program handles divide when attempting to divide by zero.
# [X] 6. The program handles erroneous input. For example the user might enter clown when asked to enter a number.
# [X] 7. The program also needs to handle erroneous operators.

### Optional Enhancements
# [X] Print out the formula in addition to the result, i.e. 2 + 2 = 4
# [X] Add support for computing exponents (2^4 = 2 * 2 * 2 * 2 = 16).
# [X] Add support for the modulo operator (10 % 3 = 1).
# [n/a] Gracefully handle unexpected user input:
# [n/a] What happens if the user input is nil (i.e., the user just pressed enter)?
# [n/a, handled by 6] What happens if the user tries to add hotdog to elephant?
# [X] Make your program know when it needs to return an integer versus a float.
# [] Add support for parentheticals, i.e. 10 / (5 + 5) = 1.
