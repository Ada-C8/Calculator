supported_ope = ["add", "+", "subtract", "-", "multiply", "*", "divide", "/",
  "power of", "^", "modulo", "%"]

$users_numbers = []

def ask_number_input(fun_input)
  auth_char = ["1","2","3","4","5","6","7","8","9","0",".","-"]
  ask_number = "yes"

  while ask_number == "yes"
    puts "\nGive me a number:"
    num = gets.chomp
    if num == fun_input
      $users_numbers << fun_input
      ask_number = "no"
    else
      num_chars = num.split("")
      forbiden_char_found = "no"
      dot_count = 0
      dash_count = 0

      num_chars.each do |char|
        unless auth_char.include? char
          forbiden_char_found = "yes"
        end
        if char == "."
          dot_count += 1
        elsif char == "-"
          dash_count += 1
        end
      end
      if forbiden_char_found == "yes"
        puts "\nYou can only enter numbers."
      elsif dot_count > 1 || num[0] == "."
        puts "\nThis is not a valid number."
      elsif dash_count > 1 || (num[1...num.length].include? "-")
        puts "\nThis is not a valid number."
      elsif dot_count == 1
        num = num.to_f
        $users_numbers << num
        puts "\nGreat number!"
        ask_number = "no"
      else
        num = num.to_i
        $users_numbers << num
        puts "\nGreat number!"
        ask_number = "no"
      end
    end
  end
end

def calculator(a, b, c)
  if a == "add" || a == "+"
    if b == "hotdog" && c == "elephant"
      puts "\n#{b} + #{c} = hotdogelephant"
    elsif b == "hotdog" && c != "elephant"
      puts "\nCan't add hotdogs and numbers."
    elsif b != "hotdog" && c == "elephant"
      puts "\nCan't add elephants and numbers."
    else
      puts "\n#{b} + #{c} = #{b+c}"
    end
  elsif a == "subtract" || a == "-"
    if b == "hotdog" && c == "elephant"
      puts "\n#{b} - #{c} = hotcat"
    elsif b == "hotdog" && c != "elephant"
      puts "\nCan't substract numbers to hotdogs."
    elsif b != "hotdog" && c == "elephant"
      puts "\nCan't substract elephants to numbers."
    else
      puts "\n#{b} - #{c} = #{b-c}"
    end
  elsif a == "multiply" || a == "*"
    if b == "hotdog" && c == "elephant"
      puts "\n#{b} * #{c} = heoltedpohgant"
    elsif b == "hotdog" && c != "elephant"
      puts "\nCan't multiply hotdogs and numbers."
    elsif b != "hotdog" && c == "elephant"
      puts "\nCan't multiply elephants and numbers."
    else
      puts "\n#{b} * #{c} = #{b*c}"
    end
  elsif a == "divide" || a == "/"
    if b == "hotdog" && c == "elephant"
      puts "\n#{b} / #{c} = hotpants"
    elsif b == "hotdog" && c != "elephant"
      puts "\nCan't divide hotdogs by numbers."
    elsif b != "hotdog" && c == "elephant"
      puts "\nCan't divide numbers by elephants."
    elsif c.to_i == 0
      puts "\nOops, can't divide by 0!"
    elsif b < c
      float_b = b.to_f
      float_c = c.to_f
      puts "\n#{b} / #{c} = #{'%.2f' % (float_b/float_c)}"
    else
      puts "\n#{b} / #{c} = #{b/c}"
    end
  elsif a == "power of" || a == "^"
    if b == "hotdog" && c == "elephant"
      puts "\nI don't even have a bad joke for this."
    elsif b == "hotdog" && c != "elephant"
      puts "\nI don't even have a bad joke for this."
    elsif b != "hotdog" && c == "elephant"
      puts "\nI don't have a good joke for this."
    else
      puts "\n#{b}^#{c} = #{((b.to_s)+" * ") *(c-1)+b.to_s} = #{b**c}"
    end
  elsif a == "modulo" || a == "%"
    if b == "hotdog" && c == "elephant"
      puts "\nI don't even have a bad joke for this."
    elsif b == "hotdog" && c != "elephant"
      puts "\nI don't even have a bad joke for this."
    elsif b != "hotdog" && c == "elephant"
      puts "\nI don't have a good joke for this."
    else
      puts "\n#{b} % #{c} = #{b%c}"
    end
  else
    puts "\nThis is not an operation."
  end
end

puts "Welcome to super-awesome-calculator"

puts "\nWhat operation do you want to perform?"
puts "Here are the possible operations: "
ope = gets.chomp.to_s.downcase

until supported_ope.include? ope
  puts "\nThis operation is not supported. Choose a different operation: add,
  subtract, multiply, divide, modulo, power of."
  ope = gets.chomp.to_s.downcase
end

ask_number_input("hotdog")
ask_number_input("elephant")
calculator(ope, $users_numbers[0], $users_numbers[1])
