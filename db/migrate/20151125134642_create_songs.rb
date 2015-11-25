class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title, default: "", null: false
      t.string :artist, default: "", null: false
      t.string :title, default: "", null: false
      t.text :text, default: "", null: false
      t.boolean :single
      t.date :release_date
      t.float :rating

      t.references :user, index: true

      t.timestamps
    end
  end
end
