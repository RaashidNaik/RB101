limit = 15

def fib(first_num, second_num, max_limit)
  while first_num + second_num < max_limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"