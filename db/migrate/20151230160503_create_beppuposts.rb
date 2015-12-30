class CreateBeppuposts < ActiveRecord::Migration
  def change
    create_table :beppuposts do |t|
      t.string :title
      t.text :content
      t.references :student, index: true

      t.timestamps null: false
    end
    add_foreign_key :beppuposts, :students

  end
end
