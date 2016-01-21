class AddAttachmentPhotoToChinaposts < ActiveRecord::Migration
  def self.up
    change_table :chinaposts do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :chinaposts, :photo
  end
end
