class CreateSouthcomments < ActiveRecord::Migration
  def change
    create_table :southcomments do |t|
      t.text :comment
      t.references :southpost, index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
