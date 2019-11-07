class Reviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :date_visited
      t.string :content
      t.integer :user_id
      t.integer :museum_id
    end
  end
end
