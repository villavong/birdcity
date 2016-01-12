class CreateOsakacomments < ActiveRecord::Migration
  def change
    create_table :osakacomments do |t|
      t.text :comment
      t.references :osakapost, index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
