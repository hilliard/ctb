class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :displayname
      t.string :description
      t.string :location
      t.string :model
      t.string :vendor
      t.string :supplier
      t.decimal :cost, :precision => 8, :scale => 2
      t.decimal :value, :precision => 8, :scale => 2
      t.string :condition
      t.string :status
      t.string :category
      t.string :color
      t.string :uom
      t.integer :user_id
      t.integer :quantity
      t.date :acquired
      t.date :retired
      t.text :note
      t.string :image_url

      t.timestamps
    end
  end
  def self.down
    drop_table :products
  end
end
