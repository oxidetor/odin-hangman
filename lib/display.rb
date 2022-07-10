module Display
  def display_game_intro
    puts "Welcome to Hangman!\n" \
         "\nEnter 'LOAD' to load your previous game or " \
         'any other character to play a new game'
  end

  def display_game_board(game)
    puts "\nWORD: #{obscure_unguessed_letters(game.secret_word, game.guessed_letters)}" \
         "\n\nWRONG GUESSES: #{game.guessed_letters - game.secret_word.split('')}\t\tLIVES: #{game.lives}\n"
  end

  def obscure_unguessed_letters(word, guessed_letters)
    word.split('').map { |letter| guessed_letters.include?(letter) ? " #{letter} " : ' _ ' }.join
  end

  def display_result(game)
    display_game_board(game)
    puts game.word_solved? ? "\nYou win\n" : "\nYou lose\n"
  end

  def display_guess_prompt
    print "\nEnter your guess (letter from A-Z)" \
         " or enter 'SAVE' to save and exit the game\n" \
         ' ==> '
  end
end
