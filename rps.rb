require 'pry'
# Pseudocode Algorithm
# 1. Prompt user to select one of three choices (R, P, or S)
# 2. Randomly select one of the three choices by the computer
# 3. Compare based on the logic that 
#     =>  P beats R but not S
#     =>  R beats S but not P
#     =>  S beats P but not R
# 4. Declare the winner and prompt to play again or end

def computer_play
  ["R","P","S"][rand(3)]
end

def header
  system("clear")
  puts "Let's play Rock, Paper, Scissors"
  puts "--------------------------------"
end

def play_again?
  again = validate_input "Would you like to go again? (Y/N)", :again
  again.upcase!
  
  again == "Y" ? play_game : (puts "Thanks for playing!")
end

def play_game
  header
  user = validate_input "Choose a Play (R/P/S)", :play
  computer = computer_play
  
  header
  winner user, computer
  play_again?
end

def prompt(msg)
  puts " => #{msg}"
  input = gets.chomp
  return input
end

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

def valid?(input, type)
  if type == :play
    !(input !~ /[RPSrps]/) && input.length == 1
  elsif type == :again
    !(input !~ /[YNyn]/)
  end
end

def winner(user, comp)
  string = case user
      when "P"
        comp == "R" ? "User Wins!" : "Computer Wins!"
      when "R"
        comp == "S" ? "User Wins!" : "Computer Wins!"
      when "S"
        comp == "P" ? "User Wins!" : "Computer Wins!"
    end
  puts string
end



play_game