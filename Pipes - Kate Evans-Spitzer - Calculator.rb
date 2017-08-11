def get_number
  num = nil
  while num == nil
    begin
      print "Enter a number: "
      input = gets.chomp
      num = Float(input)
      num = num.to_i if (num % 1 == 0)
    rescue
      print "What? That's not a number. "
    end
  end
  return num
end

def get_operator(calc_terms)
  operator_found = false
  while operator_found == false
    print "Enter an operator: "
    input = gets.chomp
    calc_terms.each do |cat|
      unless operator_found == true
        operator_found = cat[1].include?(input)
      end
    end
    print "I don't know that one. " if operator_found == false
  end
  return input
end

def calculate(num1, num2, op, calc_terms)
  equation = "#{num1} "
  if calc_terms[:add].include?(op)
    result = num1 + num2
    equation += "+ #{num2} "
  elsif calc_terms[:subtract].include?(op)
    result = num1 - num2
    equation += "- #{num2} "
  elsif calc_terms[:multiply].include?(op)
    result = num1 * num2
    equation += "* #{num2} "
  elsif calc_terms[:divide].include?(op)
    if num2 == 0
      puts "\nDividing by 0 is a bad idea. Here is your number back."
      result = num1
    else
      result = num1 / num2
      equation += "/ #{num2} "
    end
  elsif calc_terms[:modulo].include?(op)
    result = num1 % num2
    equation += "% #{num2} "
  elsif calc_terms[:exponent].include?(op)
    result = num1**num2
    equation += "^ #{num2} "
  else                                          # It _should_ be impossible to trigger this else statement
    puts "Something has gone very wrong. I'm handing your numbers back to you: #{num1}, #{num2}"
    puts "I'm putting this operator in the garbage: #{op}"
    return "very confusing"
  end

  equation += "= #{result}"
  return equation

end

def run_calculator(calc_terms)

  puts "\n  -------------------------"            # Rad title
  puts "C A L C U L A T R O N 6 0 0 0"
  puts "  -------------------------\n\n"

  num1, op, num2 = get_number, get_operator(calc_terms), get_number

  puts "\nThe result is: #{calculate(num1,num2,op,calc_terms)}"
  print "Want to go again? [Y/N]: "
  answer = gets.chomp
  if answer.upcase == 'Y'
    puts "Here you go: "
    run_calculator(calc_terms)
  else
    puts "See you later."
  end
end

calc_terms = {
  add: ['add', '+', 'plus'],
  subtract: ['subtract', '-', 'minus'],
  multiply: ['multiply', '*', 'x', 'times', 'mult'],
  divide: ['divide', '/', 'divided by', 'div'],
  modulo: ['modulo', 'modulus', '%', 'remainder'],
  exponent: ['exponent', '**', '^', 'to the power of', 'power of', 'power']
}

run_calculator(calc_terms)
