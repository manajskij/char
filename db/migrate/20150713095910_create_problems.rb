class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.text :content
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :problems, [:user_id, :created_at]
  end
end
