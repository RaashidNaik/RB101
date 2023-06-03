def tricky_method(arr_str)
  return arr_str + "rutabaga" if arr_str.is_a? String
  return arr_str +["rutabaga"] if arr_str.is_a? Array
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string = tricky_method(my_string)
my_array = tricky_method(my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"