class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def unguessed
    Guess.find_by_won(false)
  end
  
  def above_or_below(word, guess)
    match = word[/\A#{guess}/]
    lex = WordNet::Lexicon.new
    is_def = lex[guess]
    unless match == word || is_def.nil?
      i=1
      while i<=guess.length do
        match = word[/\A#{guess[0,i]}?/]
        if match.length == i
          i+=1
        else
          is_above = guess[i-1] > word[i-1]
          break
        end
      end
      if is_above
        message = "My word is before yours."
      else
        message = "My word is after yours."
      end
    else
      if is_def
        message = "You guessed it!"
      else
        message = "Your guess is not a word."
      end
    end
    return message
  end
    
end
