class AddImageIdColumnToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :image_id, :string
  end
end
