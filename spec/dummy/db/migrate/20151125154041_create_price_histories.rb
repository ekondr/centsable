class CreatePriceHistories < ActiveRecord::Migration
  def change
    create_table :price_histories do |t|
      t.references :product, index: true, foreign_key: true
      t.integer :price
      t.integer :price_old

      t.timestamps null: false
    end
  end
end
