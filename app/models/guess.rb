class Guess < ActiveRecord::Base
  attr_accessible :winner, :word, :won
  before_save :isWon
  
  scope :guessed, where('won = ?', true).order('id desc').limit(25)
  
  def isWon
    if self.winner
      self.won = true
    else
      self.won = false
    end
    return
  end

end
