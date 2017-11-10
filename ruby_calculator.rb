def calc

  puts "=====WELCOME TO MY RUBY CALCULATOR====="

    new_operation()

end

def output_menu()

  puts "=====Output Menu====="
  output_menu = ["New Operation - Clear Output", "Continue Operation", "View History", "Exit",]
  output_menu.each_with_index { |val, index| puts "[#{index + 1}] #{val}" }
  @action = gets.chomp.to_i

  while @action != 4
    case @action
      when 1
        new_operation()
      when 2
        continue_operation()
      when 3
        view_history()
      else
        puts "That is not a valid command."
        output_menu
    end
  end

  exit(0)

end

def new_operation()

  @history = []

  puts "Enter Math Expression (x + y)"
  print "> "
  expression = gets.chomp

  calc_array = expression.split(" ")

  if calc_array.length === 3

  @first_num = calc_array[0]
  @first_num = integer_test(@first_num)

  @second_num = calc_array[2]
  @second_num = integer_test(@second_num)

  @op = calc_array[1]
  @op = operator_test(@op)

  else

    puts "Error, please try again."
    new_operation()

  end

  output()

end

def continue_operation()

  puts "Enter Math Expression:"
  print "> #{@first_num} "
  expression = gets.chomp

  calc_array = expression.split(" ")

  if calc_array.length === 2

    @second_num = calc_array[1]
    @second_num = integer_test(@second_num)

    @op = calc_array[0]
    @op = operator_test(@op)

  else

    puts "Error, please try again."
    continue_operation()

  end

  output()

end

def output()

  output = "#{@first_num} #{@op} #{@second_num} = #{@first_num.send(@op, @second_num).round(2)}"

  puts "Calculating..."

  puts output

  @first_num = @first_num.send(@op, @second_num).round(2)

  @history.push(output)

  output_menu()

end

def view_history()

  puts "=====Output History====="
  @history.each { |i| puts i }
  output_menu()

end

def integer_test(num)

    if num[/^-?[0-9]\d*(\.\d+)?$/].nil?
      puts "#{num} is not a valid integer."
      print "Please try again: "
      num = gets.chomp
      integer_test(num)
    else
      return num.include?(".") ? num.to_f : num.to_i
    end
end

def operator_test(op)

  if (op == "+") || (op == "-") || (op == "/") || (op == "*")
    return op
  else
    puts "Operator #{op} is not supported. I only support + / - * operators."
    print "Please try again: "
    op = gets.chomp
    operator_test(op)
  end

  return op

end

calc()
