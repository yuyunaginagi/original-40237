class AddGradeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :grade, :string, null: true
  end
end
