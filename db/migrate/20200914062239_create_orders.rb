class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer     :prefecture_id,   null: false
      t.string      :postal,          null: false
      t.string      :city,            null: false
      t.string      :address,         null: false
      t.string      :building_number
      t.string      :phone,           null: false
      t.references  :purchaser,       null: false, foreign_key: true
      t.timestamps
    end
  end
end