class AddAttachmentPhotoToVietposts < ActiveRecord::Migration
  def self.up
    change_table :vietposts do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :vietposts, :photo
  end
end
