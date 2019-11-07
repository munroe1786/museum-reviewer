class Museums < ActiveRecord::Migration
  def change
    create_table :museums do |t|
      t.string :name
      t.string :location
    end
  end
end
