class AddAttachmentPhotoToStudentcomments < ActiveRecord::Migration
  def self.up
    change_table :studentcomments do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :studentcomments, :photo
  end
end
