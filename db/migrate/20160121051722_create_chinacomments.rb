class CreateChinacomments < ActiveRecord::Migration
  def change
    create_table :chinacomments do |t|
      t.text :comment
      t.references :chinapost, index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
