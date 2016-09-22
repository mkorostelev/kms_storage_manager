class CreateLineItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.belongs_to :warehouse, foreign_key: true
      t.belongs_to :order, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
