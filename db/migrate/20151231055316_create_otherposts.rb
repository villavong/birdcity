class CreateOtherposts < ActiveRecord::Migration
  def change
    create_table :otherposts do |t|
      t.string :title
      t.text :content
      t.references :student, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
