class Otherpost < ActiveRecord::Base
  belongs_to :student
  has_many :othercomments, :dependent => :delete_all


  has_attached_file :photo, styles: { :large => "1000x1000#", :medium => "550x550#" }
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

end
