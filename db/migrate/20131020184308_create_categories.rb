class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :category_name

      t.timestamps
    end
  end
  def self.down
    drop_table :categories
  end
end
