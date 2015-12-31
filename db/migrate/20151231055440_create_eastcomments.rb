class CreateEastcomments < ActiveRecord::Migration
  def change
    create_table :eastcomments do |t|
      t.text :comment
      t.references :eastpost, index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
