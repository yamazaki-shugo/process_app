class CreateDiaries < ActiveRecord::Migration[6.0]
  def change
    create_table :diaries do |t|
      t.date :date, null: false
      t.text :objective, null: false
      t.text :practice_menu, null: false
      t.text :discovery, null: false
      t.text :reflection, null: false
      t.text :task, null: false
      t.text :other
      t.string :mvp
      t.references :user, foreign_key: true
      t.references :room, foreign_key: true
      t.timestamps
    end
  end
end
