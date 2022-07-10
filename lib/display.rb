module Display
  def display_game_intro
    puts 'Welcome to Hangman!'
  end

  def display_game_board(game)
    puts "WORD: #{obscure_unguessed_letters(game.secret_word, game.guessed_letters)}" \
         "\n\nGUESSED: #{game.guessed_letters}\tLIVES: #{game.lives}\n"
  end

  def obscure_unguessed_letters(word, guessed_letters)
    word.split('').map { |letter| guessed_letters.include?(letter) ? " #{letter} " : ' _ ' }.join
  end

  def display_result(game)
    display_game_board(game)
    puts game.word_solved? ? 'You win' : 'You lose'
  end

  def display_guess_prompt
    puts 'Enter your letter guess'
  end
end
