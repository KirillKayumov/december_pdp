class RenameTextColumnOfSongs < ActiveRecord::Migration
  def change
    rename_column :songs, :text, :lyrics
  end
end
