class PagesController < ApplicationController

  def home
    @guesses = Guess.guessed
  end
  
  def play
    @guess = params[:guess].downcase
    @answer = unguessed.word
    @message = above_or_below(@answer, @guess)
    @count = 1
  end
  
  def guess
    @guess = params[:guess].downcase
    @count = params[:num].to_i + 1
    @answer = unguessed.word
    @message = above_or_below(@answer, @guess)
    respond_to do |format|
      format.js
    end
  end
  
  def correct
    name = params[:name]
    name = "Anon" unless params[:name]
    word = params[:word]
    
  end

end