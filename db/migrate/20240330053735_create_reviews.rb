class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :user      , null: false, foreign_key: true
      t.date       :date      , null: false
      t.string     :activity  , null: false
      t.text       :review    , null: false
      t.timestamps
    end
  end
end
