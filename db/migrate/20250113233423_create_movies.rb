class CreateMovies < ActiveRecord::Migration[8.0]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.string :genre, null: false

      t.timestamps
    end

    add_index :movies, [ :title ], unique: true
  end
end
