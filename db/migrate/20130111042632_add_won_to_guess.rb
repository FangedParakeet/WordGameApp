class AddWonToGuess < ActiveRecord::Migration
  def change
    add_column :guesses, :won, :boolean
  end
end
