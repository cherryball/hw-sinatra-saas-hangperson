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
    @word_with_guesses = ''
    (1..@word.length).each { @word_with_guesses += '-' }
  end
 
  
  def guess(letter)
      raise ArgumentError, 'Invalid guess: empty letter', caller if letter.nil? or letter.empty?
      raise ArgumentError, "Invalid guess: letter only", caller unless letter =~ /[a-zA-Z]/
      return false if @guesses.include?(letter.downcase)
      return false if @wrong_guesses.include?(letter.downcase)
      
      if @word.downcase.include? letter.downcase
          @guesses += letter.downcase
          for i in 0..@word.length-1
              @word_with_guesses[i] = letter.downcase if @word[i].downcase == letter.downcase
          end
      else 
          @wrong_guesses += letter.downcase
      end
      return true
  end
  
  def check_win_or_lose
      return :win if !@word_with_guesses.include?('-')
      return :lose if @wrong_guesses.length >= 7
      return :play
  end
  
  def word_with_guesses
    @word_with_guesses
  end

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end


end
