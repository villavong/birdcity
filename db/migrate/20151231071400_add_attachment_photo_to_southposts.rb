class AddAttachmentPhotoToSouthposts < ActiveRecord::Migration
  def self.up
    change_table :southposts do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :southposts, :photo
  end
end
