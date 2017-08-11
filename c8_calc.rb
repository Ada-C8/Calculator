puts "Let's crunch some numbers!"
puts "---------------------------------"

def operation
  operator_hash = {"add" => '+', "+" => "+", "subtract" => "-" , "-" => "-", "multiply" => "*", "*" => "*", "divide" => "/", "/" => "/"}
  print "Enter an operator: "
  math_verb = gets.chomp.downcase
  until operator_hash.has_key?(math_verb)
    print "Enter an operator: "
    math_verb = gets.chomp.downcase
  end
  return operator_hash[math_verb]
end

def num_input
  print "Enter a number: "
  number = Float(gets.chomp) rescue nil
  until number.is_a?(Float) do
    print "This is not a number. Please enter a number: "
    number = Float(gets.chomp) rescue nil
  end
  return number
end

def calculation(num1, operation, num2)
  case operation
    when "+"
      return num1 + num2
    when "-"
      return num1 - num2
    when "*"
      return num1 * num2
    when "/"
      if num2 == 0
        puts "You can't divide by 0"
      else
        return num1 / num2
      end
  end
end

def final_calculation
  num1 = num_input
  mode = operation
  num2 = num_input
  total = calculation(num1, mode, num2)
  puts "#{num1} #{mode} #{num2} = #{total}"
end

final_calculation
