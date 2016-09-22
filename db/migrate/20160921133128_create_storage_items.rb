class CreateStorageItems < ActiveRecord::Migration[5.0]
  def change
    create_table :storage_items do |t|
      t.references :warehouse

      t.references :product

      t.integer :quantity, default: 0

      t.timestamps null: false
    end
  end
end
