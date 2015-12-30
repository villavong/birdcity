class CreateBeppucomments < ActiveRecord::Migration
  def change
    create_table :beppucomments do |t|
      t.text :comment
      t.references :beppupost, index: true
      t.references :student, index: true

      t.timestamps null: false
    end
    add_foreign_key :beppucomments, :beppuposts
    add_foreign_key :beppucomments, :students
  end
end
