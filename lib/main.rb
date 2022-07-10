# Display an intro message to the user
# Display the occluded word and number of guesses left to user
# Prompt user to provide a letter
# Check that letter is valid. If not display appropriate message to user
# If letter is valid, check if it exists in saved word
# Provide feedback for the user's guess
# End the game if out of turns or saved word is guessed
# Display final message to user based on result

require './lib/game'

game = Game.new
game.play_game
