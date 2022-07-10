module Display
  def display_game_intro
    puts "Welcome to Hangman!\n"
    puts "Enter 'LOAD' to load an existing game or any other character to play a new game"
  end

  def display_game_board(game)
    puts "\nWORD: #{obscure_unguessed_letters(game.secret_word, game.guessed_letters)}" \
         "\n\nWRONG GUESSES: #{game.guessed_letters - game.secret_word.split('')}\tLIVES: #{game.lives}\n"
  end

  def obscure_unguessed_letters(word, guessed_letters)
    word.split('').map { |letter| guessed_letters.include?(letter) ? " #{letter} " : ' _ ' }.join
  end

  def display_result(game)
    display_game_board(game)
    puts game.word_solved? ? "\nYou win\n" : "\nYou lose\n"
  end

  def display_guess_prompt
    puts "\nEnter your letter guess\n"
  end
end
