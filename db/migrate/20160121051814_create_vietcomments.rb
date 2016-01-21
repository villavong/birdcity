class CreateVietcomments < ActiveRecord::Migration
  def change
    create_table :vietcomments do |t|
      t.text :comment
      t.references :vietpost, index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
