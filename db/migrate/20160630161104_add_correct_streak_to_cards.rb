class AddCorrectStreakToCards < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :correct_streak, :integer, default: 0
  end
end
