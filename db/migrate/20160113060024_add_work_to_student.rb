class AddWorkToStudent < ActiveRecord::Migration
  def change
    add_column :students, :work, :string
  end
end
