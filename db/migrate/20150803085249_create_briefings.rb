class CreateBriefings < ActiveRecord::Migration
  def change
    create_table :briefings do |t|
      t.text :brief
      t.integer :user_id
      t.boolean :closed, default: false

      t.timestamps null: false
    end
    add_index :briefings, [:user_id, :created_at]
  end
end
