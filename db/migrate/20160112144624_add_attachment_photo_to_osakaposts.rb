class AddAttachmentPhotoToOsakaposts < ActiveRecord::Migration
  def self.up
    change_table :osakaposts do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :osakaposts, :photo
  end
end
