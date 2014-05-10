class AddPhotoToThemes < ActiveRecord::Migration
  def self.up
    add_attachment :themes, :photo
  end

  def self.down
    remove_attachment :themes, :photo
  end
end
