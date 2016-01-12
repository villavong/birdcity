class AddAttachmentPhotoToFukuokaposts < ActiveRecord::Migration
  def self.up
    change_table :fukuokaposts do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :fukuokaposts, :photo
  end
end
