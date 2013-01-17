class PagesController < ApplicationController

  def home
    @guesses = Guess.guessed
  end
  
  def play
    @guess = params[:guess].downcase
    @answer = unguessed.word
    @message = above_or_below(@answer, @guess)
    if @message[/again/]
      redirect_to root_url, notice: "#{@message}"
    elsif @message[/guessed/]
      render 'lucky.html'
    else
      render 'play'
    end
  end
  
  def guess
    @guess = params[:guess].downcase
    @answer = unguessed.word
    @message = above_or_below(@answer, @guess)
    if @message[/again/]
      render 'again.js'
    elsif @message[/guessed/]
      render 'right.js'
    else
      render 'wrong.js'
    end
  end
  
  def correct
    name = params[:name]
    name = "Anon" unless params[:name]
    word = params[:word]
    lex = WordNet::Lexicon.new
    unless lex[word]
      @message = "Sorry, that isn't a word! Please try again."
      render 'anew.html'
    else
      answer = unguessed
      answer.winner = name
      answer.save
      Guess.create(word: word)
      redirect_to root_url
    end
  end

end