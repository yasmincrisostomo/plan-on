class CreateProfileTraits < ActiveRecord::Migration[6.1]
  def change
    create_table :profile_traits do |t|
      t.references :user, null: false, foreign_key: true
      t.references :trait, null: false, foreign_key: true
      t.string :user_answer

      t.timestamps
    end
  end
end
