class AddAttachmentPhotoToTokyoposts < ActiveRecord::Migration
  def self.up
    change_table :tokyoposts do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :tokyoposts, :photo
  end
end
