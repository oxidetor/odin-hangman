require './lib/display'

class Game
  include Display
  attr_reader :secret_word
  attr_accessor :guessed_letters, :lives

  def initialize
    @secret_word = select_random_word
    @guessed_letters = []
    @lives = 10
  end

  # Get random word from dictionary
  def select_random_word
    File.open('dictionary.txt') do |file|
      file.readlines
          .map(&:chomp)
          .filter { |word| word.length.between?(5, 12) }
          .sample
          .upcase
    end
  end

  def play_game
    display_game_intro
    play_turn until game_over?
    display_result
  end

  def game_over?
    lives.zero? || word_solved?
  end

  def word_solved?
    false
  end

  def play_turn
    display_game_board(self)
    guess = ''
    until valid_guess?(guess)
      display_guess_prompt
      guess = gets.upcase.chomp
    end
    guessed_letters.push(guess)
    self.lives -= 1 unless correct_guess?(guess)
  end

  def correct_guess?(guess)
    secret_word.split('').include?(guess)
  end

  def valid_guess?(guess)
    guess.match?(/[A-Z]/) &&
      !guessed_letters.include?(guess) &&
      guess.length == 1
  end
end
