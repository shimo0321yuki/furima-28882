class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :information
      t.integer :genre_id
      t.integer :status_id
      t.integer :price
      t.integer :delivery_fee_id
      t.integer :area_id
      t.integer :days_id
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
