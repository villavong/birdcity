class CreateFukuokacomments < ActiveRecord::Migration
  def change
    create_table :fukuokacomments do |t|
      t.text :comment
      t.references :fukuokapost, index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
