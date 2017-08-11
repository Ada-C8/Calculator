def r_or_z(n)
  if n.include?(".")
    return n.to_f
  else
    return n.to_i
  end
end


puts "Welcome to the fun calculator"



puts "Please provide the name  or symbol of the operation that you would like to do"
operation=gets.chomp



puts "Please provide the first number."
puts "The operation will be made at the order that you entered"
n1=gets.chomp
n1=r_or_z(n1)


puts "Provide the second number."
n2=gets.chomp
n2=r_or_z(n2)

symbol="unvalid"

while  symbol !="valid" do

  if operation == "+" || operation == "add"
    puts "#{n1} + #{n2} = #{n1+n2}"
    symbol ="valid"
  elsif operation == "-" || operation == "subtract"
    puts "#{n1} - #{n2} = #{n1-n2}"
    symbol ="valid"
  elsif operation == "*" || operation == "multiply"
    puts "#{n1} * #{n2} = #{n1*n2}"
    symbol ="valid"
  elsif    operation == "/" || operation == "divide"
    while n2==0 do
      puts "It is no possible to divide by 0. Please enter a valid number"
      n2=gets.chomp
      n2=r_or_z(n2)
    end
    puts "#{n1} / #{n2} = #{n1.to_f/n2}"
    symbol ="valid"
  else
    puts "Sorry, you entered an invalid operation."
    puts "Please provide the name or symbol of the operation that you would like to do"
    symbol ="unvalid"
    operation=gets.chomp
  end

end

puts "Thanks for using fun calculator"
