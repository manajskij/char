class AddClosedToProblems < ActiveRecord::Migration
  def change
    add_column :problems, :closed, :boolean, default: :false
  end
end
