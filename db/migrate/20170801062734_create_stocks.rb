class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.integer :amount, default: 1
      t.references :store, foreign_key: true
      t.references :book, foreign_kesy: true

      t.timestamps
    end
  end
end
