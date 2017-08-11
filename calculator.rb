### ALL DEFINED METHODS
# Create class method to check if strings are numeric
class String
  def numeric?
    Float(self) != nil rescue false
  end
end
# Method for validating number inputs
def val(number_to_val)
   # Call class String method to check
  # Alternative? --> while (number_to_val != '0' && number_to_val.to_i.to_f.to_s != number_to_val.strip)
  unless number_to_val.numeric?
    puts "Please enter a valid integer" ## CONTINUE TO STAY TRUE
    number_to_val = gets.chomp
  end
  return number_to_val
end
# Method for validating operator
def val_op(op_to_val)
  until ["+", "ADD", "-", "SUBTRACT", "*", "MULTIPLY", "/", "DIVIDE"].include?(op_to_val) ## UNTIL FALSE
    puts "Please enter a valid operator"
    op_to_val = gets.chomp.upcase
  end
  return op_to_val
end
# Method to run final calculations based on choices
def calc(op_type, num_1, num_2)
  # Conditional to run calulations based on operator choice
  case op_type
    when "+", "ADD"
      return num_1 + num_2
    when "-", "MINUS"
      return num_1 - num_2
    when "*", "MULTIPLY"
      return num_1 * num_2
    else
      return num_1 / num_2
  end
end
#########################################################################
##################### THIS IS WHERE IT ALL BEGINS #######################
#########################################################################
puts "======== WELCOME TO CALCULATOR ========"
puts
### GET FIRST NUMBER - CALL METHOD - VALIDATE - RETURN VALUE: STRING
puts "First number to calculate?"
input_num_1 = gets.chomp #10
returned_num_1 = val(input_num_1)

### GET OPERATOR - CALL METHOD - VALIDATE - RETURN VALUE: STRING
puts "What would you like to do? +, -, /, *"
input_oper = gets.chomp.upcase
returned_op = val_op(input_oper)

### GET SECOND NUMBER - CALL METHOD - VALIDATE - RETURN VALUE: STRING
puts "Second number to calculate?"
input_num_2 = gets.chomp
returned_num_2 = val(input_num_2)

### CONVERT INPUT NUMBERS TO FLOATS IN CASE OF DECIMAL PLACES
num_1, num_2 = returned_num_1.to_f, returned_num_2.to_f

### CALL CALCULATION METHOD TO GET FINAL RETURNED CALCULATION
returned_calc = calc(returned_op, num_1, num_2)

### DISPLAY FIXNUM IF ONLY FIXNUMS
if returned_calc % 1 == 0 # INTEGERS WILL ALWAYS HAVE REMAINDER 0 IF DIVDED BY ONE
  returned_calc = returned_calc.to_i
  puts "Your requested calculation is: #{returned_calc}"
else
  puts "Your requested calculation is: #{returned_calc}"
end
