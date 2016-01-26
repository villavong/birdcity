class AddPayToStudent < ActiveRecord::Migration
  def change
    add_column :students, :pay, :string
    add_column :students, :gift, :text
  end
end
