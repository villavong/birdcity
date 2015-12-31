class AddAttachmentPhotoToBeppuposts < ActiveRecord::Migration
  def self.up
    change_table :beppuposts do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :beppuposts, :photo
  end
end
