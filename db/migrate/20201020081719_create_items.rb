class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.interger :category_id
      t.interger :product_condition_id
      t.interger :shipping_charges_id
      t.interger :shipping_area_id
      t.interger :days_to_ship_id
      t.interger :price
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
