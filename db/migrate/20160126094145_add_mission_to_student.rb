class AddMissionToStudent < ActiveRecord::Migration
  def change
    add_column :students, :mission, :text
  end
end
