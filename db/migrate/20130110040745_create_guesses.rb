class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.string :word
      t.string :winner

      t.timestamps
    end
  end
end
