class AddAttachmentPhotoToEastposts < ActiveRecord::Migration
  def self.up
    change_table :eastposts do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :eastposts, :photo
  end
end
