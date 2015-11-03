class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  attr_accessor :word
  attr_accessor :wrong_guesses
  attr_accessor :guesses
  
  # to make the tests in spec/hangperson_game_spec.rb pass.
  
  # Get a word from remote "random word" service
  def initialize(word)
    @word = word
    @wrong_guesses = ''
    @guesses = ''
  end
 
  
  def guess(letter)
      @word.each_char { |w| w == letter ? @guesses = w : @wrong_guesses = '' }
  end
  
  def check_win_or_lose
  end
  
  def word_with_guesses
  end

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end


end
