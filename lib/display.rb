module Display
  def display_game_intro
    puts 'Welcome to Hangman!'
  end

  def display_game_board(game)
    puts game.lives.to_s + ' Game Board'
  end

  def display_result
    puts 'Game Over!'
  end

  def display_guess_prompt
    puts 'Enter your letter guess'
  end
end
