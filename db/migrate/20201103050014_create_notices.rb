class CreateNotices < ActiveRecord::Migration[6.0]
  def change
    create_table :notices do |t|
      t.text :content, null: false
      t.integer :user_id, foreign_key: true
      t.integer :room_id, foreign_key: true
      t.timestamps
    end
  end
end
