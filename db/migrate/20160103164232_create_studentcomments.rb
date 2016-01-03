class CreateStudentcomments < ActiveRecord::Migration
  def change
    create_table :studentcomments do |t|
      t.text :comment
      t.references :student, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
