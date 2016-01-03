class AddAuthorAttributesToStudentcomment < ActiveRecord::Migration
  def change
    add_column :studentcomments, :author_email, :string
    add_column :studentcomments, :author_id, :integer
  end
end
