class PagesController < ApplicationController

  def home
    @guesses = Guess.guessed
  end
  
  def play
    @guess = params[:guess]
    @answer = unguessed.word
    @message = above_or_below(@answer, @guess)
  end
  
  def guess
    
  end

end