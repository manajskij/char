class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment
      t.references :user, index: true, foreign_key: true
      t.references :problem, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :comments, [:user_id, :problem_id, :created_at]
  end
end
