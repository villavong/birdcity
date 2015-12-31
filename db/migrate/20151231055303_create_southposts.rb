class CreateSouthposts < ActiveRecord::Migration
  def change
    create_table :southposts do |t|
      t.string :title
      t.text :content
      t.references :student, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
