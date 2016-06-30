class AddIncorrectStreakToCards < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :incorrect_streak, :integer, default: 0
  end
end
