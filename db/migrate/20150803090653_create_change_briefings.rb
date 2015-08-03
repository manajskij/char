class CreateChangeBriefings < ActiveRecord::Migration
  def change
    create_table :change_briefings do |t|
      t.text :chbrief
      t.integer :brief_id
      t.integer :user_id
      t.boolean :closed, default: false

      t.timestamps null: false
    end
    add_index :change_briefings, [:brief_id, :user_id, :created_at]
  end
end
