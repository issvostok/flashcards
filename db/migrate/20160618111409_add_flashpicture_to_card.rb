class AddFlashpictureToCard < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :flashpicture, :string
  end
end
