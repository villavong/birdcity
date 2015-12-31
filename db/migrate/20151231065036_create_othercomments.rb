class CreateOthercomments < ActiveRecord::Migration
  def change
    create_table :othercomments do |t|
      t.text :comment
      t.references :otherpost, index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
