class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.string :name
      t.string :color
      t.references :card, null: false, foreign_key: true

      t.timestamps
    end
  end
end
