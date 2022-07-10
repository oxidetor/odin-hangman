require './lib/display'
require './lib/serializable'
require 'yaml'

class Game
  include Serializable
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
    load_game if gets.chomp.upcase == 'LOAD'
    play_turn until game_over?
    display_result(self)
  end

  def load_game
    File.open('savegame.txt') { |file| unserialize(file.read) }
  end

  def game_over?
    lives.zero? || word_solved?
  end

  def word_solved?
    secret_word.split('') - guessed_letters == []
  end

  def play_turn
    display_game_board(self)
    guess = ''
    until valid_guess?(guess)
      display_guess_prompt
      guess = gets.upcase.chomp
      save_and_exit if guess == '1'
    end
    guessed_letters.push(guess)
    self.lives -= 1 unless correct_guess?(guess)
  end

  def save_and_exit
    File.open('savegame.txt', 'w') { |file| file.write serialize }
    exit
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
