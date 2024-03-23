class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|
      t.string :game_name

      t.timestamps
    end
  end
end
