class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :product_id, index: true, foreign_key: true
      t.integer :quantity, default: 0
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
