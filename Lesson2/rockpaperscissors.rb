VALID_CHOICES = %w(rock paper scissors spock lizard)
ABBR_CHOICES = %w(r p sc sp l)

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'rock' && second == 'lizard') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'paper' && second == 'spock') ||
    (first == 'scissors' && second == 'paper') ||
    (first == 'scissors' && second == 'lizard') ||
    (first == 'lizard' && second == 'spock') ||
    (first == 'lizard' && second == 'paper') ||
    (first == 'spock' && second == 'rock') ||
    (first == 'spock' && second == 'scissors')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif player == computer
    prompt("It's a tie!")
  else
    prompt("Computer won!")
  end
end


loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(',')}")
    choice = Kernel.gets().chomp()
    if VALID_CHOICES.include?(choice)
      break
    elsif ABBR_CHOICES.include?(choice)
      choice = VALID_CHOICES[ABBR_CHOICES.index(choice)]
      break
    else
      prompt("That's not a valid choice")
    end
  end
  computer_choice = VALID_CHOICES.sample
  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")
  display_results(choice, computer_choice)
  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end
prompt("Thanks for playing!")
