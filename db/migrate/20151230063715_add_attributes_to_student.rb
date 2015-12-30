class AddAttributesToStudent < ActiveRecord::Migration
  def change
    add_column :students, :name, :string
    add_column :students, :school, :string
    add_column :students, :major, :string
    add_column :students, :city, :string
    add_column :students, :nationality, :string
    add_column :students, :introduction, :text
  end
end
