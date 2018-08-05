class AddDoNotWantToWallpapers < ActiveRecord::Migration[5.1]
  def change
    add_column :wallpapers, :do_not_want, :boolean, default: false
  end
end
