# Ask the user for two numbers
# Ask the user to for an operation to perform
# Perform the operation on the two numbers
# Output the result

require 'yaml'

MESSAGES = YAML.load_file('calculator_messages.yml')


def prompt(message)
  Kernel.puts(" => #{message}")
end

def valid_integer?(num)
  num.to_i.to_s == num
end

def valid_float?(num)
  num.to_f.to_s == num 
end

def operation_to_message(op)
  word = case op
         when '1'
          'addop'
         when '2'
          'subop'
         when '3'
          'mulop'
         when '4'
          'divop'
         end
  # Random line of code here 
  
  return word
end


prompt(MESSAGES['welcome']['eng'])

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(MESSAGES['validname']['eng'])
  else
    break
  end
end

number1 = ''
number2 = ''
loop do# the main loop
  loop do 
    prompt(MESSAGES['firstnum']['eng'])
    number1 = Kernel.gets().chomp()

    if valid_integer?(number1)
      number1 = number1.to_i
      break
    elsif valid_float?(number1)
      number1 = number1.to_f
      break
    else
      prompt(MESSAGES['validnum']['eng'])
    end
  end

  loop do
    prompt(MESSAGES['secondnum']['eng'])
    number2 = Kernel.gets().chomp()
    if valid_integer?(number2)
      number2 = number2.to_i
      break
    elsif valid_float?(number2)
      number2 = number2.to_f
      break
    else
      prompt(MESSAGES['validnum']['eng'])
    end
  end

  operator_prompt = MESSAGES['opmessage']['eng']

  prompt(operator_prompt)

  operator = ''

  loop do
    operator = Kernel.gets().chomp()

    if %(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES['validop']['eng'])
    end
  end

  prompt("#{MESSAGES[operation_to_message(operator)]['eng']} #{MESSAGES['twonums']['eng']}")

  result = case operator
  when '1'
    result = number1 + number2
  when '2'
    result = number1 - number2
  when '3'
    result = number1 * number2
  when '4'
    result = number1 / number2
  end

  prompt("#{MESSAGES['resultmsg']['eng']} #{result}")

  prompt(MESSAGES['calcagain']['eng'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end