VALID_CHOICES = %w(rock paper scissors spock lizard)
ABBR_CHOICES = %w(r p sc sp l)
WINNING = {
  'rock' => ['scissors', 'lizard'],
  'paper' => ['rock', 'spock'],
  'scissors' => ['paper', 'lizard'],
  'lizard' => ['spock', 'paper'],
  'spock' => ['scissors', 'rock']
}

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  WINNING.each do |key, array|
    return true if (first == key) && (array.include?(second))
  end
  false
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

player_score = 0
computer_score = 0

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
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

  if win?(choice, computer_choice)
    player_score += 1
  elsif choice == computer_choice
    player_score += 0
    computer_score += 0
  else
    computer_score += 1
  end
  prompt("Scoreboard: You: #{player_score} Computer #{computer_score}")

  break if (player_score == 3) || (computer_score == 3)
  # prompt("Do you want to play again?")
  # answer = Kernel.gets().chomp()
  # break unless answer.downcase().start_with?('y')
end

player_score == 3 ? prompt("You win!") : prompt("Computer wins")
prompt("Thanks for playing!")
