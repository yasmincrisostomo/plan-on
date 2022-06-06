class CreateTraits < ActiveRecord::Migration[6.1]
  def change
    create_table :traits do |t|
      t.string :name
      t.string :message

      t.timestamps
    end
  end
end
