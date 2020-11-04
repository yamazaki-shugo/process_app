class CreateOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      t.string :name, null: false
      t.string :phone_number, null: false
      t.string :postal_code, null: false
      t.integer :prefecture_id, null: false
      t.string :municipality, null: false
      t.string :address, null: false
      t.integer :occupation_id, null: false
      t.references :user, foreign_key: true
      t.timestamps 
    end
  end
end
