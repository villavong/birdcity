class CreateTokyocomments < ActiveRecord::Migration
  def change
    create_table :tokyocomments do |t|
      t.text :comment
      t.references :tokyopost, index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
