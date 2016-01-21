class CreateChinaposts < ActiveRecord::Migration
  def change
    create_table :chinaposts do |t|
      t.string :title
      t.text :content
      t.references :student, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
