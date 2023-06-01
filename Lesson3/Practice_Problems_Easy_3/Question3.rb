def factors(number)
  factors = []
  (1..number).each do |divisor|
    factors << number / divisor if number % divisor == 0
  end
  factors
end

p factors(10)