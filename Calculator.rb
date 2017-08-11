# Calculator Exercise
def is_operator(list,user_input)
  if list[user_input] == nil
    puts "I didn't get that. Please try again!"
    print "Operation? "
    operator = is_operator(list,gets.chomp)
  else
    return list[user_input]
  end
end

def is_number(input)
  new_input = input.tr('abcdefghijklmnopqrstuvwxyz','')
  if new_input.empty?
    puts "Sorry, I can't find a number. Please try again!"
    print "Number? "
    is_number(gets.chomp)
  elsif input.include? "."
    return input.to_f
  else
    return input.to_i
  end
end

def print_results(r,n1,n2,sign)
  puts "Your result is #{r}"
  puts "Your forumula: #{n1} #{sign} #{n2} = #{r}"
end

operation = {
  "add"=>:add,
  "+"=>:add,
  "subtract"=>:subtract,
  "-"=>:subtract,
  "multiply"=>:multiply,
  "*"=>:multiply,
  "divide"=>:divide,
  "/"=>:divide,
  "exponent"=>:exponent,
  "^"=>:exponent,
  "modulo"=>:modulo,
  "%"=>:modulo
}

puts "Welcome to your console calculator!"

print "First number? "
a = is_number(gets.chomp)
print "Second number? "
b = is_number(gets.chomp)
print "Operation? "
operator = is_operator(operation, gets.chomp)

if operator == :add
  print_results(a+b,a,b,"+")
elsif operator == :subtract
  print_results(a-b,a,b,"-")
elsif operator == :multiply
  print_results(a*b,a,b,"*")
elsif operator == :divide
  if b == 0
    print_results("inf",a,b,"/")
  else
    print_results(a/b,a,b,"/")
  end
elsif operator == :exponent
  print_results(a**b,a,b,"^")
elsif operator == :modulo
  print_results(a%b,a,b,"%")
end
