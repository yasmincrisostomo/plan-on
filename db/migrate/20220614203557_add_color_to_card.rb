class AddColorToCard < ActiveRecord::Migration[6.1]
  def change
    add_column :cards, :color, :integer
  end
end
