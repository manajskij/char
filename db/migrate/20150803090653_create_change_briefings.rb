class CreateChangeBriefings < ActiveRecord::Migration
  def change
    create_table :change_briefings do |t|
      t.text :brief
      t.integer :briefing_id
      t.integer :user_id
      t.boolean :closed, default: false

      t.timestamps null: false
    end
    add_index :change_briefings, [:user_id, :created_at]
    add_index :change_briefings, [:briefing_id]
  end
end
