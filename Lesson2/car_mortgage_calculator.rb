# Obtain the 3 following pieces of information
# 1. Loan Amount
# 2. Annual Percentage Rate
# 3. Loan Duration

# Need to calculate the following information
# 1. Monthly Interest Rate
# 2. Loan Duration in months
# 3. Monthly payment

# m = p * (j / (1 - (1 + j)**(-n)))
# m = monthly payment
# p = loan amount
# j = monthly interest rate
# n = loan duration in months

def validate_input?(userinput)
  # If user creates a float without a leading zero
  # Need to add the zero to allow for later validation steps
  userinput = "0" + userinput if userinput.start_with?(".")
  # Checks if input is integer, float & > 0
  (userinput.to_f.to_s == userinput ||
    userinput.to_i.to_s == userinput) &&
    (userinput.to_f > 0)
end

Kernel.puts("Welcome to the Mortgage Calculator!\n")

# Defining values outside the loops
loan_amount = ''
ann_per_rate = ''
loan_duration = ''

# User enters in the Loan Amount and validation method is called
loop do
  Kernel.puts("Please enter your Loan Amount($)")
  loan_amount = Kernel.gets().chomp()
  break if validate_input?(loan_amount)
  Kernel.puts("Please enter a valid loan amount in $")
end

# User enter in the APR and validation method is called
loop do
  Kernel.puts("\nPlease enter your Annual Percentage Rate(%)")
  ann_per_rate = Kernel.gets().chomp()
  break if validate_input?(ann_per_rate)
  Kernel.puts("Please enter a valid Annual Percentage Rate(%)")
end

# User enter in the loan duration and validation method is called
loop do
  Kernel.puts("\nPlease enter your Loan Duration(years)")
  loan_duration = Kernel.gets().chomp()
  break if validate_input?(loan_duration)
  Kernel.puts("Please enter a valid Loan Duration in years")
end

puts "\n\nCalculating....."

# Calculating monthly interest rate
month_int_rate = ann_per_rate.to_f / 12
puts "The monthly interest rate is: #{month_int_rate}%"
# Converting monthly interest rate into a decimal
month_int_rate /= 100

# Calculating loan duration in months
loan_duration_month = loan_duration.to_f * 12
puts "The monthly loan duration is: #{loan_duration_month} months"

# Calculating monthly payment
month_payment = loan_amount.to_f * (month_int_rate /
  (1 - (1 + (month_int_rate))**(-loan_duration_month)))
puts "The monthly payment is: $#{month_payment}"
