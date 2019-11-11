class CreateReviewpages < ActiveRecord::Migration
  def change
    create_table :reviewpages do |t|
      t.string :museum_name
      t.string :location
      t.string :date_visited
      t.string :content
      t.integer :user_id, foreign_key: true
      t.timestamps null: false
    end
  end
end