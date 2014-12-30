require 'pry'
# Pseudocode Algorithm
# 1. Prompt user to select one of three choices (R, P, or S)
# 2. Randomly select one of the three choices by the computer
# 3. Compare based on the logic that 
#     =>  P beats R but not S
#     =>  R beats S but not P
#     =>  S beats P but not R
# 4. Declare the winner and prompt to play again or end


# eliminate clutter on the interface
def header
  system("clear")
  puts "Let's play Rock, Paper, Scissors"
  puts "--------------------------------"
end

# group the logic that encompasses a full round of the game
def play_game
  header
  user = validate_input "Choose a Play (R/P/S)", :play
  computer = ["R","P","S"][rand(3)]
  
  # determine who won this round
  header
  string = case user
      when computer
        "It's a TIE!!!"
      when "P"
        computer == "R" ? "Paper covers rock! YOU WIN!" : "Scissors cut paper! Computer Wins!"
      when "R"
        computer == "S" ? "Rock breaks scissors! YOU WIN!" : "Paper covers Rock! Computer Wins!"
      when "S"
        computer == "P" ? "Scissors cut paper! YOU WIN!" : "Rock breaks scissors! Computer Wins!"
    end
  puts string
  
  # ask the user if they wish to play again
  again = validate_input "Would you like to go again? (Y/N)", :again
  again.upcase!
  again == "Y" ? play_game : (puts "Thanks for playing!")
end

# as the user a question and return the result
def prompt(msg)
  puts " => #{msg}"
  input = gets.chomp
  return input
end

# check that the input the user gave is valid. re-prompt repeatedly if not. return valid input
def validate_input(msg, type)
  input = prompt msg
  good = false
  
  while good == false
    if valid?(input, type)
      good = true
    else
      system("clear")
      puts "INVALID INPUT: Please try again"
      input = prompt msg
    end
  end
  
  return input.upcase
end

# set the qualifications of valid input by category
def valid?(input, type)
  if type == :play
    !(input !~ /[RPSrps]/) && input.length == 1
  elsif type == :again
    !(input !~ /[YNyn]/)
  end
end


# begin the game
play_game