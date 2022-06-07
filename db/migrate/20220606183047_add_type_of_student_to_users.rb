class AddTypeOfStudentToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :type_of_student, :string
  end
end
