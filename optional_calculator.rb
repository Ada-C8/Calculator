# Returns a String of a passed in equation array
def get_equation(arr)
  str = ""
  arr.length.times do |i|
    str << " #{arr[i]}"
  end
  return str
end

def print_available_operator(operator_hash)
  operator_array = operator_hash.values.flatten
  str = "[" + operator_array[0]
  (1...operator_array.length).each do |i|
    str << ", #{operator_array[i]}"
  end
  print str + "]"
end


# Returns true if item is in the list of operators (operator hash)
def in_oH(operatorHash, item)
  operatorHash.values.flatten.include?(item) ? true : false #Ternary format
end

#Calculates the result of a passed in equation array
def calculate(arr)
  modified_arr = []
  modified_arr.replace(arr)

  # Replaces layman terms operators in array with actual operator
  # ex. replace all '^' or 'exponent' with '**'
  # Solution credit: SO, https://stackoverflow.com/questions/5646710/change-value-of-array-element-which-is-being-referenced-in-a-each-loop
  modified_arr.map! do |x|
    if x == "add"
      x = "+"
    elsif x == "minus"
      x = "-"
    elsif x == "multiply"
      x = "*"
    elsif x == "divide"
      x = "/"
    elsif x == "^" || x == "exponent"
      x = "**"
    elsif x == "mod"
      x = "%"
    elsif x == "open parenthesis"
      x = "("
    elsif x == "closed parenthesis"
      x = ")"
    else
      x
    end
  end

  # Calculates for answer as a float
  modified_arr.insert(0, "1.0 *")

  modified_arr.pop #because you don't need the = sign for evaluating, eval() does that for you
  modified_equation_str = get_equation(modified_arr)

  # Returns an String of an int if no decimal value
  # Otherwise, keeps the answer a float (that's a String)
  # https://ruby-doc.org/core-2.2.0/Kernel.html
  answer = sprintf("%g", eval(modified_equation_str))
  if answer == "Inf"
    raise ZeroDivisionError
  else
    return answer
  end
end

# List of Strings that can be input as operators
oH = {
  "+": ["add", "+"],
  "-": ["minus", "-"],
  "*": ["multiply", "*"],
  "/": ["divide", "/"],
  "^": ["exponent", "^"],
  "%": ["mod", "%"],
  "=": ["equals", "="],
  "(": ["open parenthesis", "("],
  ")": ["closed parenthesis", ")"]
}

#Array containing all the numbers and operators
equation_array = []
#Current number/operator user has input
current_item = ""

# Prompts user for operator/number
# Re-prompts the user if they pass in a String not included in the available operator list
until current_item == "equals" || current_item == "="
  print "\nCurrent equation:"
  print get_equation(equation_array)

  puts "\nType an operator or number to add to the equation"
  print "[Type 'equals' or '=' to calculate the existing equation]: "

  current_item = gets.chomp

  until in_oH(oH, current_item) || current_item == current_item.to_i.to_s || current_item == current_item.to_f.to_s
    puts "\nThat is an invalid value. The available operators are: "
    print_available_operator(oH)
    print "\nPlease type an operator or number: "
    current_item = gets.chomp.to_s
  end

  equation_array << current_item
end

print "\nFinal Equation:"
print "#{get_equation(equation_array)} "

# Catch ZeroDivisionError: http://blog.honeybadger.io/a-beginner-s-guide-to-exceptions-in-ruby/
# Multiple rescue statements: http://mikeferrier.com/2012/05/19/rescuing-multiple-exception-types-in-ruby-and-binding-to-local-variable/
# Prints a custom error message if user divides by 0 OR the equation cannot be evaluated
# Otherwise it prints and calculates the equation normally
begin
  print "#{calculate(equation_array)}\n"
rescue ZeroDivisionError => e
    puts "\nYour equation divided by 0 and caused an error."
    puts "Please restart calculator and try another equation."
rescue SyntaxError
    puts "\nYour equation cannot be evaluated."
    puts "Please restart calculator and try another equation."
end

#OPTIONAL:
# [X] - Print out formula w/ result ie. 2 + 2 = 4
# [X] - Add support for exponents ^
# [X] - Add support for modulo operator %
# [X] - Handle unexpected user input (if user presses enter [nil]? Adds strings together?)
#     (cases prevent user from passing strings, nil is considered an invalid value)
# [X] - Make program know when it needs to return an integer versus a float
# [X] - add support for parentheticals i.e. 10 / ( 5 + 5) = 1
