class CreateNotices < ActiveRecord::Migration[6.0]
  def change
    create_table :notices do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
