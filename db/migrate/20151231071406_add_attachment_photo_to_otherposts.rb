class AddAttachmentPhotoToOtherposts < ActiveRecord::Migration
  def self.up
    change_table :otherposts do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :otherposts, :photo
  end
end
