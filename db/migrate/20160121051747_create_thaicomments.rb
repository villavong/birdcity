class CreateThaicomments < ActiveRecord::Migration
  def change
    create_table :thaicomments do |t|
      t.text :comment
      t.references :thaipost, index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
