class CreateWallpapers < ActiveRecord::Migration[5.1]
  def change
    create_table :wallpapers do |t|
      t.string :identifier
      t.string :name
      t.string :description
      t.integer :width
      t.integer :height
      t.timestamp :fetched
      t.timestamp :last_used
      t.string :image

      t.timestamps
    end
  end
end
