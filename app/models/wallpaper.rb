class Wallpaper < ApplicationRecord
  mount_uploader :image, ImageUploader

  def self.current
    w = Wallpaper.where(do_not_want: false).where('last_used > ?', 1.day.ago).first
    return w if w
      
    w = Wallpaper.order('last_used ASC').first
    w.last_used = DateTime.now
    w.save
    w
  end

  def do_not_want!
    self.do_not_want = true
    self.save!
  end
end
