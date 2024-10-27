library(glue)

Game_PYC <- function() {
  weapon <- c("Hammer", "Scissor", "Paper")

  point_win <- as.integer(readline("Choose how many points to win (1-5): "))
  print("These are the weapons you can choose:")
  print(weapon)

  # Input validation loop
  while (point_win < 1 || point_win > 5) {
    print("Invalid input. Please enter a number between 1 and 5.")
    point_win <- as.integer(readline("Choose how many points to win (1-5): "))
  }

  point_user <- 0
  point_bot <- 0

  while (point_user < point_win && point_bot < point_win) {  # Changed from '||' to '&&'
    User_select <- readline("Choose your weapon: ")

    # Input validation loop
    while (! User_select %in% weapon) {
      print("Invalid weapon. Please choose from Hammer, Scissor, or Paper.")
      User_select <- readline("Choose your weapon: ")
    }

    Bot_select <- sample(weapon, 1)

    print(glue("Bot selected {Bot_select}. User points: {point_user}, Bot points: {point_bot}"))

    # Simplified the win/loss logic
    if (User_select == Bot_select) {
      print("It's a tie!")
    } else if ((User_select == "Scissor" && Bot_select == "Paper") ||
               (User_select == "Paper" && Bot_select == "Rock") ||
               (User_select == "Rock" && Bot_select == "Scissor")) {
      point_user <- point_user + 1
      print("You win this round!")
    } else {
      point_bot <- point_bot + 1
      print("Bot wins this round!")
    }
  }

  # Determine the final winner (moved inside the function)
  if (point_bot == point_win) {
    print("Bot wins the game!")
  } else if(point_user == point_win){ # Added else if
    print("You win the game!")
  }
}

# Start the game
Game_PYC()
