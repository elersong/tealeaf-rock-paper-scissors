require 'pry'
# Pseudocode Algorithm
# 1. Prompt user to select one of three choices (R, P, or S)
# 2. Randomly select one of the three choices by the computer
# 3. Compare based on the logic that 
#     =>  P beats R but not S
#     =>  R beats S but not P
#     =>  S beats P but not R
# 4. Declare the winner and prompt to play again or end

def prompt(msg)
  puts " => #{msg}"
  input = gets.chomp
  return input
end

def computer_play
  ["R","P","S"][rand(3)]
end

def valid_play?(input)
  !(input !~ /[RPSrps]/) && input.length == 1
end

def validate_input(msg)
  input = prompt msg
  good = false
  
  while good == false
    if valid_play?(input)
      #binding.pry
      good = true
    else
      #binding.pry
      puts "INVALID INPUT"
      input = prompt msg
    end
  end
  
  return input.upcase
end

# -------------------- Begin main logic

puts "Let's play Rock, Paper, Scissors"
puts "--------------------------------"
user = validate_input "Choose a Play (R/P/S)"
#binding.pry
computer = computer_play

puts "user: #{user}"
puts "computer: #{computer}"

