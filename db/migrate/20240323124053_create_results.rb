class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|
      t.date    :date      , null: false
      t.string  :game_name , null: false
      t.integer :event_id  , null: false
      t.string  :result    , null: false
      t.timestamps
    end
  end
end
