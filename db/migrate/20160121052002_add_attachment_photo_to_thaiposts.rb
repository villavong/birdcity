class AddAttachmentPhotoToThaiposts < ActiveRecord::Migration
  def self.up
    change_table :thaiposts do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :thaiposts, :photo
  end
end
