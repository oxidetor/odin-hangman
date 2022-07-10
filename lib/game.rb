require './lib/display'

class Game
  include Display
  attr_reader :secret_word

  def initialize
    @secret_word = select_random_word
  end

  # Get random word from dictionary
  def select_random_word
    File.open('dictionary.txt') do |file|
      file.readlines
          .map(&:chomp)
          .filter { |word| word.length.between?(5, 10) }
          .sample
    end
  end

  def play_game
    display_game_intro
  end
end
